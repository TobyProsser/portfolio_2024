import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_network/image_network.dart';

class DisplayImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const DisplayImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
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
    return FutureBuilder(
      future: _imageUrlFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          print("IMAGE ERROR: " + snapshot.error.toString());
          return Text(snapshot.error.toString());
        } else {
          return IgnorePointer(
            ignoring: true,
            child: ImageNetwork(
              image: snapshot.data as String,
              width: widget.width,
              height: widget.height,
            ),
          );
        }
      },
    );
  }
}
