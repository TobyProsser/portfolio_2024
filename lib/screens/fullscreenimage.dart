import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class FullScreenImage extends StatefulWidget {
  // create a constructor to receive the image path
  const FullScreenImage(this.imagePath, {super.key});
  // create a field to store the image path
  final String imagePath;

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

  // override the build method to return a widget
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // return a scaffold widget with the photo view widget
    return Scaffold(
      body: FutureBuilder(
        future: _imageUrlFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("IMAGE ERROR: " + snapshot.error.toString());
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Stack(
              children: [
                // use a photo view widget to show the image with zoom and pan features
                ImageNetwork(
                  image: snapshot.data as String,
                  width: screenWidth,
                  height: screenHeight,
                ),
                // use a positioned widget to place the exit button at the top right corner
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
