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

    // Check if width > height and device is mobile, then rotate the image
    bool rotateImage = false;
    if (widget.width != null && widget.height != null) {
      if (widget.width! > widget.height! &&
          MediaQuery.of(context).size.shortestSide < 600) {
        rotateImage = true;
      }
    }

    return Scaffold(
      body: FutureBuilder<String>(
        future: _imageUrlFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
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
                        child: Transform.rotate(
                          angle: rotateImage
                              ? 90 * 3.14159 / 180
                              : 0, // Rotate by 90 degrees if needed
                          child: ImageNetwork(
                            image: snapshot.data!,
                            width: displayWidth,
                            height: displayHeight,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
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
