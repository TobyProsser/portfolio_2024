import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_network/image_network.dart';

class FullScreenImage extends StatefulWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const FullScreenImage(this.imagePath, {super.key, this.width, this.height});

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late Future<String> _imageUrlFuture;

  @override
  void initState() {
    super.initState();
    _imageUrlFuture = _getImageUrl(widget.imagePath);
  }

  Future<String> _getImageUrl(String imagePath) async {
    final ref = FirebaseStorage.instance.ref().child(imagePath);
    String imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Use provided width and height if available, otherwise use screen dimensions
    final double displayWidth = widget.width ?? screenWidth;
    final double displayHeight = widget.height ?? screenHeight;
    print("width: " + displayWidth.toString());
    return Scaffold(
      body: FutureBuilder<String>(
        future: _imageUrlFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("IMAGE ERROR: ${snapshot.error}");
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return InteractiveViewer(
                      panEnabled: true,
                      minScale: 0.1,
                      maxScale: 4.0,
                      child: Center(
                        child: ImageNetwork(
                          image: snapshot.data!,
                          width: displayWidth,
                          height: displayHeight,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      // pop the current page from the navigation stack
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
