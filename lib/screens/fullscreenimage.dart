import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {
  // create a constructor to receive the image path
  const FullScreenImage(this.path, {super.key});
  // create a field to store the image path
  final String path;
  // override the build method to return a widget
  @override
  Widget build(BuildContext context) {
    // return a scaffold widget with the photo view widget
    return Scaffold(
      body: Stack(
        children: [
          // use a photo view widget to show the image with zoom and pan features
          PhotoView(
            imageProvider: AssetImage(path),
          ),
          // use a positioned widget to place the exit button at the top right corner
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                // pop the current page from the navigation stack
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
