import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2024/widgets/displayimage.dart';
import 'package:portfolio_2024/widgets/simpleHtmlYoutubeIframe.dart';

import '../screens/fullscreenimage.dart';
import 'dart:html' as html;

class MobileSwap extends StatefulWidget {
  const MobileSwap(
      {super.key,
      required this.youtubeLink,
      required this.youtubeCode,
      required this.imagePath,
      required this.vertical});

  final String youtubeLink;
  final String youtubeCode;
  final String imagePath;
  final bool vertical;
  @override
  State<MobileSwap> createState() => _MobileSwapState();

  MobileSwap copyWith({
    String? youtubeLink,
    String? imagePath,
    bool? vertical,
  }) {
    return MobileSwap(
      youtubeLink: youtubeLink ?? this.youtubeLink,
      imagePath: imagePath ?? this.imagePath,
      vertical: vertical ?? this.vertical,
      youtubeCode: youtubeCode ?? this.youtubeCode,
    );
  }
}

class _MobileSwapState extends State<MobileSwap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: widget.vertical
              ? Container(
                  height: 350,
                  width: 175,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 250, 253, 255), // Set the container color to blue
                    borderRadius: BorderRadius.circular(
                        20), // Set the container edges to be curved
                    boxShadow: [
                      // Add a dropshadow effect
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.5), // Set the shadow color to black with some opacity
                        blurRadius: 10, // Set the blur radius of the shadow
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      DisplayImage(
                        imagePath: widget.imagePath,
                        width: 175,
                        height: 350,
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: const Icon(Icons.preview, color: Colors.white),
                          onPressed: () {
                            print("Button CLicked");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FullScreenImage(widget.imagePath),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      width: 300,
                      height: 175,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 250, 253,
                            255), // Set the container color to blue
                        borderRadius: BorderRadius.circular(
                            20), // Set the container edges to be curved
                        boxShadow: [
                          // Add a dropshadow effect
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.5), // Set the shadow color to black with some opacity
                            blurRadius: 10, // Set the blur radius of the shadow
                            offset: const Offset(
                                5, 5), // Set the offset of the shadow
                          ),
                        ],
                      ),
                      child: DisplayImage(
                        imagePath: widget.imagePath,
                        width: 300,
                        height: 175,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          // navigate to a new page with the full screen image
                          print("Button CLicked");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FullScreenImage(widget.imagePath),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.black,
                        ))
                  ],
                ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            clipBehavior: Clip.hardEdge,
            constraints: const BoxConstraints(
              maxWidth: 400, // Set the maximum width to 200
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                  255, 250, 253, 255), // Set the container color to blue
              borderRadius: BorderRadius.circular(
                  20), // Set the container edges to be curved
              boxShadow: [
                // Add a dropshadow effect
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.5), // Set the shadow color to black with some opacity
                  blurRadius: 10, // Set the blur radius of the shadow
                  offset: const Offset(5, 5), // Set the offset of the shadow
                ),
              ],
            ),
            child: Center(
                child: SimpleHtmlYoutubeIframe(
              youtubeCode: widget.youtubeCode,
              key: null,
            )),
          ),
        ),
        //YOUTUBE CLIP BUTTON
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     children: [
        //       Text(
        //         "Youtube Clip ",
        //         style: GoogleFonts.interTight(
        //           textStyle: Theme.of(context).textTheme.displayLarge,
        //           fontSize: 20,
        //           fontWeight: FontWeight.w400,
        //           color: Colors.black,
        //         ),
        //         textAlign: TextAlign.center,
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       FloatingActionButton.extended(
        //         backgroundColor: const Color(0xffFF0000),
        //         label: Text(
        //           "Youtube",
        //           style: GoogleFonts.interTight(
        //             textStyle: Theme.of(context).textTheme.displayLarge,
        //             fontSize: 20,
        //             fontWeight: FontWeight.w600,
        //             color: const Color.fromARGB(255, 255, 246, 246),
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //         onPressed: () {
        //           html.window.open(widget.youtubeLink, '_blank');
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
