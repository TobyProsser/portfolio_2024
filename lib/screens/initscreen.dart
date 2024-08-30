import 'package:flutter/material.dart';

class Initscreen extends StatefulWidget {
  const Initscreen({super.key});

  @override
  State<Initscreen> createState() => _InitscreenState();
}

class _InitscreenState extends State<Initscreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Center(
          child: Text(
            'FathomCreative',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ));
  }
}
