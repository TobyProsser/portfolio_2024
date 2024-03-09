import 'dart:html' as html; // for opening web pages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2024/widgets/mobileswap.dart';
import 'package:portfolio_2024/widgets/simpleHtmlYoutubeIframe.dart';
//import 'package:pdfx/pdfx.dart';

import '../screens/fullscreenimage.dart';

// ignore: must_be_immutable
class UnityContent extends StatefulWidget {
  UnityContent({
    super.key,
    this.globalKey,
    this.open = true,
    required this.mobile,
  });
  final bool mobile;
  late GlobalKey<UnityContentState>? globalKey;
  late bool open = true;

  @override
  State<UnityContent> createState() => UnityContentState();

  UnityContent copyWith({
    GlobalKey<UnityContentState>? globalKey,
    bool? open,
    bool? mobile,
  }) {
    return UnityContent(
      globalKey: globalKey ?? this.globalKey,
      open: open ?? this.open,
      mobile: mobile ?? this.mobile,
    );
  }
}

class UnityContentState extends State<UnityContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void loadVideo() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink: "https://youtu.be/aqsQiXQv4Sw",
                imagePath: "assets/images/videoCovers/LofiIslandsCover.png",
                vertical: true,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "aqsQiXQv4Sw",
                    key: null,
                  )),
                ),
              ),

        const SizedBox(
          height: 20,
        ),
        Text(
          "Lofi Islands DEMO",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "A 3d mobile game created in Unity using C#. It is a relaxing and calming game where the player fishes and grows crops to make money to build up their island, or buy new ones. The game includes randomly generated islands and an AR mode.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(20.0),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width * .25,
        //           height: 500,
        //           clipBehavior: Clip.hardEdge,
        //           decoration: BoxDecoration(
        //             color: const Color.fromARGB(
        //                 255, 250, 253, 255), // Set the container color to blue
        //             borderRadius: BorderRadius.circular(
        //                 20), // Set the container edges to be curved
        //             boxShadow: [
        //               // Add a dropshadow effect
        //               BoxShadow(
        //                 color: Colors.black.withOpacity(
        //                     0.5), // Set the shadow color to black with some opacity
        //                 blurRadius: 10, // Set the blur radius of the shadow
        //                 offset:
        //                     const Offset(5, 5), // Set the offset of the shadow
        //               ),
        //             ],
        //           ),
        //           child: Image.asset("assets/images/ShellDrawing.jpeg"),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(20.0),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width * .25,
        //           height: 500,
        //           clipBehavior: Clip.hardEdge,
        //           decoration: BoxDecoration(
        //             color: const Color.fromARGB(
        //                 255, 250, 253, 255), // Set the container color to blue
        //             borderRadius: BorderRadius.circular(
        //                 20), // Set the container edges to be curved
        //             boxShadow: [
        //               // Add a dropshadow effect
        //               BoxShadow(
        //                 color: Colors.black.withOpacity(
        //                     0.5), // Set the shadow color to black with some opacity
        //                 blurRadius: 10, // Set the blur radius of the shadow
        //                 offset:
        //                     const Offset(5, 5), // Set the offset of the shadow
        //               ),
        //             ],
        //           ),
        //           child: Image.asset("assets/images/ShellDrawing.jpeg"),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(20.0),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width * .25,
        //           height: 500,
        //           clipBehavior: Clip.hardEdge,
        //           decoration: BoxDecoration(
        //             color: const Color.fromARGB(
        //                 255, 250, 253, 255), // Set the container color to blue
        //             borderRadius: BorderRadius.circular(
        //                 20), // Set the container edges to be curved
        //             boxShadow: [
        //               // Add a dropshadow effect
        //               BoxShadow(
        //                 color: Colors.black.withOpacity(
        //                     0.5), // Set the shadow color to black with some opacity
        //                 blurRadius: 10, // Set the blur radius of the shadow
        //                 offset:
        //                     const Offset(5, 5), // Set the offset of the shadow
        //               ),
        //             ],
        //           ),
        //           child: Image.asset("assets/images/ShellDrawing.jpeg"),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Island Generation",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "The islands are procedurally generated to allow for unlimited islands, the algorithm follows specific perameters in order to keep a consistant style.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "View the Code: ",
                    style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Color(0xff6e5494),
                    label: Text(
                      "GitHub",
                      style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xfffafafa),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      html.window.open(
                          'https://github.com/TobyProsser/LofiIslands',
                          '_blank');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink:
                    "https://youtube.com/shorts/xpuXeBJluq8?feature=share",
                imagePath: "assets/images/videoCovers/PlanetWalker.png",
                vertical: true,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "xpuXeBJluq8",
                    key: null,
                  )),
                ),
              ),

        const SizedBox(
          height: 20,
        ),
        Text(
          "Planet Walker",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "A 2d endless runner type mobile game created in Unity using C#. Released on the App Store and Google Play Store, reaching over 24,000 downloads on the App Store and over 5,000 downloads on the Google Play Store. It also spent time on the App Stores Top Charts in the Arcade section. The player runs around circle planets and taps to jump from planet to planet using Faux Gravity.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Faux Gravity",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "I implemented a 2D faux gravity system that allows the player to jump to different planets. I used a collider component attached to the player character, and a script that calculates the gravitational force and direction based on the distance and angle between the player and the planet. The script also applies a torque force to the player to make them rotate towards the planet's surface.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "View the Code: ",
                    style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Color(0xff6e5494),
                    label: Text(
                      "GitHub",
                      style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xfffafafa),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      html.window.open(
                          'https://github.com/TobyProsser/AstroRun', '_blank');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Play in the bowser: ",
                    style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    label: Text(
                      "Itch.io",
                      style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      html.window.open(
                          'https://tobyprosser.itch.io/planet-walker',
                          '_blank');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink:
                    "https://youtube.com/shorts/Xwrs9FQPljg?feature=share",
                imagePath: "assets/images/videoCovers/SliceyJump.png",
                vertical: true,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "Xwrs9FQPljg",
                    key: null,
                  )),
                ),
              ),

        const SizedBox(
          height: 20,
        ),
        Text(
          "Slicey Jump",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "A 3d mobile game made in Unity using C#. I hired an artist to make the characters. The player swipes on the bottom of the screen to spin the character and taps on different tiles to jump from tile to tile. The goal is to kill the enemies on each tile before the timer runs out.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Voxel Animation",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "I have used magicaVoxel, a free and lightweight voxel editor, to create various 3D models of objects and characters. MagicaVoxel allows me to design  3D pixelated and stylized models. To achieve a unique animation style, I created multiple versions of these models to act as frames and wrote a script to switch out these models to give the illusion of motion in C#. This technique creates a smooth and dynamic animation effect that enhances the gameplay experience.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "View the Code: ",
                    style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Color(0xff6e5494),
                    label: Text(
                      "GitHub",
                      style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xfffafafa),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      html.window.open(
                          'https://github.com/TobyProsser/Jump-and-Slice',
                          '_blank');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Play in the bowser: ",
                    style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    label: Text(
                      "Itch.io",
                      style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      html.window.open(
                          'https://tobyprosser.itch.io/slicey-jump', '_blank');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}

// ignore: must_be_immutable
class UnrealContent extends StatefulWidget {
  UnrealContent({
    super.key,
    this.globalKey,
    this.open = true,
    required this.mobile,
  });
  final bool mobile;

  late GlobalKey<UnrealContentState>? globalKey;
  late bool open = true;

  @override
  State<UnrealContent> createState() => UnrealContentState();

  UnrealContent copyWith({
    GlobalKey<UnrealContentState>? globalKey,
    bool? open,
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return UnrealContent(
      globalKey: globalKey ?? this.globalKey,
      open: open ?? this.open,
      mobile: mobile ?? this.mobile,
    );
  }
}

class UnrealContentState extends State<UnrealContent>
    with TickerProviderStateMixin {
  // late PdfControllerPinch pdfPinchController;

  @override
  void initState() {
    super.initState();
  }

  void loadVideo() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink: "https://youtu.be/fL1uo3cDW4U",
                imagePath: "assets/images/videoCovers/ArcMastermind.png",
                vertical: false,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "fL1uo3cDW4U",
                    key: null,
                  )),
                ),
              ),

        const SizedBox(
          height: 20,
        ),
        Text(
          "Arc Mastermind",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          "(Prototype)",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Each player is a warrior who can personalize themselves with deep character, weapon, and fighting style customization. Allowing the player to truly represent their in-game personality through their champion. Or soon-to-be champion, as you must start off from the bottom as a hopeless fighter of course. By building decks of attacks and abilities in the form of cards, prepare for each duel by setting the order in which these cards occur in the fight. Each and every fight is a glorious, choreographed, pixel art battle like seen in no other video game. Smooth animations, connected with randomness, bring a unique feeling to each and every fight. This player-predetermined brawl is filled with particles and beautiful colors magnificently exhibiting their tailored warrior in battle. Not only are you playing a game, but creating a masterpiece of a duel.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Project Details",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        GestureDetector(
          onTap: () {
            // navigate to a new page with the full screen image
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FullScreenImage(
                    "assets/images/ArcMastermindText1.png"),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              constraints: BoxConstraints(
                maxWidth: 400,
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
              child: Image.asset("assets/images/ArcMastermindText1.png"),
            ),
          ),
        ),
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Text(
//             """this project’s focus is on
// customization and feel. The gameplay loop is built to be easy enough for anyone to pick up and
// this is done by having an extremely simple core game loop. Collect cards that represent
// different attacks, movements, and abilities you can perform in battle, and select the order in
// which you want them to happen. The structure of the core game loop is nearing
// completion(minus multiplayer) and currently holds placeholder assets. Having the gameplay so
// close to completion means this is the perfect opportunity for this project to display the Unreal
// Engine’s ability to combine 2D and 3D art using PaperZD. Besides multiplayer, if given this
// generous grant, it will go towards three pillars. Deep Customization, Wondrous Art, and
// Stunning Sound Design will create an attractive game that could only previously be dreamed of.
// Using a steampunk theme, the main scene is where the player will customize their fighter as
// well as their deck to suit their desired play style. Players can equip weapons that their attack
// cards will use. These weapons, as well as ability cards and cosmetics, can be rewarded by
// hitting milestones or from the morning gifts. Although the player has to get up after their alarm in
// order to collect these gifts, and the longer it takes to collect them, the less valuable the item will
// be. This is a unique mechanic to encourage players to wake up after their alarm. This is how
// they will receive a lot of necessary items in the game.
// Slotting six of these cards into a device in an order you appoint will commence a fight between
// you and another player. As each card is slotted in, its corresponding animation plays in a tube
// located above each slot. Each of the six animations is played in order at the same time as the
// other player. Although this fight will differ from the normal perception of a pixel character fight as
// the event will play like a choreographed movie set by the player. Most games will use an
// animation that feels responsive, which in 2d games means that a lot of the action of swinging a
// sword is lost. By including these frames, and adding randomness between the different actions
// set by the player, each fight can be alluring and unique. Each detail from unsheathing the sword
// to returning back to a fighting stance after swinging will be animated. when the final animation
// ends, the player who has taken the most damage will collapse. Stringing these wins in a row will
// grant you rewards at different milestones.
// The preparation scene is where the player is randomly given cards from the deck they have
// created, and they must create the best attack plan they can with the cards given to them. After
// customizing your character to your exact needs, and selecting your favorite weapon. You can
// now decide exactly how your fighter will move in the upcoming battle. Create your own
// strategies to beat out your opponents. Using a ranged attack after creating space with a backup
// card, or armoring up before using many attack cards in a row is just a couple of creative
// strategies players can invent.
// The fight scene is where two players clash. This fight consists of six stages. In each stage, both
// characters will play their respective animations. Unless one of the cards is marked as ‘first
// strike’(an example card would be a dodge or block), they will play at the same time. One
// character may have chosen to attack in this stage, and hopefully, the other player chose to
// block, dodge, jump, counter, or heal. Making each stage an exciting, complex game of
// rock-paper-scissors.
// Continue fighting players until you run out of cards in your deck or surpass a predetermined
// amount of victories. Certain cards like potions and armor-ups are consumable, so a destroy
// particle animation will play once you put them into the slot during the preparation scene. While
// your non-consumable cards will ‘lose battery power’ and have to be slotted out and recharged
// after your fights in a small minigame. While you do not have to play this minigame right after the
// fight, you will not be able to use the card until it is charged.
// You will be able to collect these consumable cards from the morning gifts. After the players'
// alarm goes off, they have a predetermined amount of time to collect the package in-game. This
// unique mechanic aims to give players that extra push in the morning to get out of bed. If you fail
// to collect this package before the time limit, it will slowly degrade with the amount of time it takes
// for the player to access it. Although this project will not force a good sleeping schedule upon
// you. The user can set the alarm to go off at any time of morning, day, or night. So those who do
// not wish to log on during the morning, do not have to.
// String wins in a row to reach different set milestones that will reward the player with more cards
// or weapons. To add another level of urgency to get wins in a row, this stat will always show next
// to the opponent's name, and there will be a global leaderboard to keep track of who has the
// longest streak.""",
//             style: GoogleFonts.interTight(
//               textStyle: Theme.of(context).textTheme.displayLarge,
//               fontSize: 20,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
        // PdfViewPinch(
        //   builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
        //     options: const DefaultBuilderOptions(),
        //     documentLoaderBuilder: (_) =>
        //         const Center(child: CircularProgressIndicator()),
        //     pageLoaderBuilder: (_) =>
        //         const Center(child: CircularProgressIndicator()),
        //     errorBuilder: (_, error) => Center(child: Text(error.toString())),
        //   ),
        //   controller: pdfPinchController,
        // ),
        Column(
          children: [
            Text(
              "View the Code: ",
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xff6e5494),
              label: Text(
                "GitHub",
                style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffafafa),
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                html.window.open(
                    'https://github.com/TobyProsser/Arc_Mastermind', '_blank');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink: "https://youtu.be/b1BuuSyNqaQ",
                imagePath: "assets/images/videoCovers/RubixSurvival.png",
                vertical: false,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "b1BuuSyNqaQ",
                    key: null,
                  )),
                ),
              ),

        const SizedBox(
          height: 20,
        ),
        Text(
          "Puzzle Survival",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(
          height: 3,
        ),
        Text(
          "(Prototype)",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            """A mobile clicker game built to be addicting and designed to play while doing other tasks such as watching movies or YouTube. The main mechanics will focus on tapping the screen so that the player does not need to be paying too much attention to it in order to play. The player’s character lives on a cube that looks static with a grid of nine biomes laid out on each side, but when the player drags on of the tiles, the ground will shake and rumble beneith the characters feet as his world begins to change, rotating in the form of a rubiks cube. With 3 of the 9 tiles the character has access too now changed, he has access to biomes he privously didn't. When the character is in a biome, the player can tap the screen and the character will collect materials in that area. This game targets a younger audience who like having something else to do while they watch other forms of media.""",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Overview",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            """This is a mobile clicker game concept. The player plays as a character living in a Rubik’s cube style world. Each tile, or colored square, is a different biome in which players can collect materials from. The player can tap on a tile and the character will walk towards it. The player can only move to tiles on the same face that they are standing on, so in order to reach tiles on the other side of the cube, the player must shift the cube to make the desired biome appear on the same face as the player. While shifting the cube around, the player must be careful to not allow the spawner tile to be on the same face as the player, or the player will be attacked by monsters. Once the character reaches the biome, the player can continue tapping to make the character collect materials from that biome. The player can use these materials to craft better tools to collect more materials or sell them at the shop. The money earned from the shop can be used to upgrade the biomes. For example, the forest biome will start with only a few trees, but upgrading it will spawn more, making it faster to collect wood. The goal of the game is to collect the currency as well as fully upgrade their cube and tools. The player's score, or amount of currency, will be posted on a world leaderboard to encourage people to collect more of the currency. Later updates will include abilities to place buildings and decorations to customize your cube, as well as a food/farming system.""",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            // navigate to a new page with the full screen image
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FullScreenImage("assets/images/blueprints1.png"),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 400,
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
                    offset: const Offset(5, 5), // Set the offset of the shadow
                  ),
                ],
              ),
              child: Image.asset('assets/images/blueprints1.png'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // navigate to a new page with the full screen image
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FullScreenImage("assets/images/blueprints2.png"),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 400,
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
                    offset: const Offset(5, 5), // Set the offset of the shadow
                  ),
                ],
              ),
              child: Image.asset("assets/images/blueprints2.png"),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "View the Code: ",
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xff6e5494),
              label: Text(
                "GitHub",
                style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffafafa),
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                html.window.open(
                    'https://github.com/TobyProsser/Rubix_Survival', '_blank');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}

class BsiAboutContent extends StatefulWidget {
  const BsiAboutContent({
    super.key,
    required this.mobile,
  });
  final bool mobile;
  @override
  State<BsiAboutContent> createState() => _BsiAboutContentState();
  BsiAboutContent copyWith({
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return BsiAboutContent(
      mobile: mobile ?? this.mobile,
    );
  }
}

class _BsiAboutContentState extends State<BsiAboutContent> {
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Black Swan Intelligence",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            width: 300,
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/BSIInfo/Slide1.jpg"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                child: Image.asset("assets/images/BSIInfo/Slide1.jpg"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/BSIInfo/Slide2.jpg"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                child: Image.asset("assets/images/BSIInfo/Slide2.jpg"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/BSIInfo/Slide3.PNG"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                child: Image.asset("assets/images/BSIInfo/Slide3.PNG"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/BSIInfo/Slide4.PNG"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                child: Image.asset("assets/images/BSIInfo/Slide4.PNG"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/BSIInfo/Slide5.PNG"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                child: Image.asset("assets/images/BSIInfo/Slide5.PNG"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BSIDevContent extends StatefulWidget {
  BSIDevContent({
    super.key,
    this.globalKey,
    this.open = true,
    required this.mobile,
  });
  final bool mobile;
  late GlobalKey<BSIDevContentState>? globalKey;
  late bool open = true;

  @override
  State<BSIDevContent> createState() => BSIDevContentState();

  BSIDevContent copyWith({
    GlobalKey<BSIDevContentState>? globalKey,
    bool? open,
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return BSIDevContent(
      globalKey: globalKey ?? this.globalKey,
      open: open ?? this.open,
      mobile: mobile ?? this.mobile,
    );
  }
}

class BSIDevContentState extends State<BSIDevContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "BSI's Design",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "I made a collage of designs that inspired me and drew some basic sketches to outline my vision. Then, I turned to figma to begin the UI design process.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            // navigate to a new page with the full screen image
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const FullScreenImage("assets/images/BSIDev/BSIDEV1.png"),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
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
                    offset: const Offset(5, 5), // Set the offset of the shadow
                  ),
                ],
              ),
              child: Image.asset("assets/images/BSIDev/BSIDEV1.png"),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "I have used UX design principles to create engaging and intuitive interfaces for my applications. After finding a theme that suited my project, I began laying out the UX using wireframes and mockups. I liked the look of the 'cards' I saw in some of the designs in my research and thought they would work excellently for representing an individual threat or asset. Cards are a versatile and modular UI element that can display different types of content and actions. I used cards to create a clear and consistent visual hierarchy, as well as to enable easy navigation and interaction for the users.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            // navigate to a new page with the full screen image
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const FullScreenImage("assets/images/BSIDev/BSIDEV2.png"),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
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
                    offset: const Offset(5, 5), // Set the offset of the shadow
                  ),
                ],
              ),
              child: Image.asset("assets/images/BSIDev/BSIDEV2.png"),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            """After gathering an idea of how the app would function, I went back to design. When implementing more of the required features, the interface became cluttered. The design of the application was always meant to be targeted towards the end user, it had to be accessible to every business owner, even ones with no knowledge of security. To make sure the app could guide them through this sometimes overwhelming process I decided to go with a very simple and obvious layout, with a creative spin to keep in engaging. Using a slightly off-white background and rich dark grey text the purpose of each page stood out To keep the design interesting I decided to make most interactive components with a multicolored graident with an inset shadow. Combined with the white slate of the background, this would make it appear as though the shapes of the buttons had been cut of of the pure background exposing a wonderful gradient of sea colors.""",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink:
                    "https://youtube.com/shorts/1EAZN7g9Zl4?feature=share",
                imagePath: "assets/images/videoCovers/SpeedTour.png",
                vertical: true,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "1EAZN7g9Zl4",
                    key: null,
                  )),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "The design is also built to be responsive, so the web app is accessible no matter what platform you are trying to reach it from. There is also a dashboard retricted for admin use only avaiable on the desktop that has control over the more mobile orentented verison built for the team on location.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink: "https://youtu.be/kxncr2rNzbo",
                imagePath: "assets/images/videoCovers/BSIResponsive.png",
                vertical: false,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "kxncr2rNzbo",
                    key: null,
                  )),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "I also built a dashboard so that the admins could quickly look over all the data the people in the field have gathered. This is also where the the Admin can assign roles, give access to buildings and look at the companies history.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink: "https://youtu.be/BLEVkjmxw_4",
                imagePath: "assets/images/videoCovers/BSIDashboard.png",
                vertical: false,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "BLEVkjmxw_4",
                    key: null,
                  )),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}

class DrawingsContent extends StatefulWidget {
  const DrawingsContent({
    super.key,
    required this.mobile,
  });
  final bool mobile;

  @override
  State<DrawingsContent> createState() => _DrawingsContentState();
  DrawingsContent copyWith({
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return DrawingsContent(
      mobile: mobile ?? this.mobile,
    );
  }
}

class _DrawingsContentState extends State<DrawingsContent> {
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Drawings",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            width: 300,
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              constraints: BoxConstraints(
                maxWidth: 400,
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
              child: Image.asset("assets/images/ShellDrawing.jpeg"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              constraints: BoxConstraints(
                maxWidth: 400,
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
              child: Image.asset("assets/images/EyeDrawing.jpg"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ModelVideoContent extends StatefulWidget {
  ModelVideoContent({
    super.key,
    this.globalKey,
    this.open = true,
    required this.mobile,
  });
  final bool mobile;

  late GlobalKey<ModelVideoContentState>? globalKey;
  late bool open = true;

  @override
  State<ModelVideoContent> createState() => ModelVideoContentState();

  ModelVideoContent copyWith({
    GlobalKey<ModelVideoContentState>? globalKey,
    bool? open,
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return ModelVideoContent(
      globalKey: globalKey ?? this.globalKey,
      open: open ?? this.open,
      mobile: mobile ?? this.mobile,
    );
  }
}

class ModelVideoContentState extends State<ModelVideoContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          widget.mobile
              ? MobileSwap(
                  youtubeLink:
                      "https://youtube.com/shorts/RHfPbcMsx1Q?feature=share",
                  imagePath: "assets/images/videoCovers/BallDropModel.png",
                  vertical: false,
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    constraints: const BoxConstraints(
                      maxWidth: 400, // Set the maximum width to 200
                    ),
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
                    child: const Center(
                        child: SimpleHtmlYoutubeIframe(
                      youtubeCode: "RHfPbcMsx1Q",
                      key: null,
                    )),
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          widget.mobile
              ? MobileSwap(
                  youtubeLink: "https://youtu.be/ZBtIcdt92lc",
                  imagePath: "assets/images/videoCovers/RobotWalking.png",
                  vertical: false,
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    constraints: const BoxConstraints(
                      maxWidth: 400, // Set the maximum width to 200
                    ),
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
                    child: const Center(
                        child: SimpleHtmlYoutubeIframe(
                      youtubeCode: "1cRI-09-5vE",
                      key: null,
                    )),
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          widget.mobile
              ? MobileSwap(
                  youtubeLink: "https://youtu.be/1cRI-09-5vE",
                  imagePath: "assets/images/videoCovers/TruckModel.PNG",
                  vertical: false,
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    constraints: const BoxConstraints(
                      maxWidth: 400, // Set the maximum width to 200
                    ),
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
                    child: const Center(
                        child: SimpleHtmlYoutubeIframe(
                      youtubeCode: "ZBtIcdt92lc",
                      key: null,
                    )),
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

//USE COLLAGE IMAGES INSTEAD OF PUTTING EACH IMAGE IN HERE
class GalleryContent extends StatefulWidget {
  const GalleryContent({
    super.key,
    required this.mobile,
  });
  final bool mobile;

  @override
  State<GalleryContent> createState() => _GalleryContentState();
  AboutPortfolioContent copyWith({
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return AboutPortfolioContent(
      mobile: mobile ?? this.mobile,
    );
  }
}

class _GalleryContentState extends State<GalleryContent> {
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Gallery",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            width: 300,
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/GamesGallery1.png"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                constraints: BoxConstraints(
                  maxWidth: 400,
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
                      offset:
                          const Offset(5, 5), // Set the offset of the shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/images/GamesGallery1.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/GamesGallery2.png"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                constraints: BoxConstraints(
                  maxWidth: 400,
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
                      offset:
                          const Offset(5, 5), // Set the offset of the shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/images/GamesGallery2.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class AboutContent extends StatefulWidget {
  const AboutContent({
    super.key,
    required this.mobile,
  });
  final bool mobile;

  @override
  State<AboutContent> createState() => _AboutContentState();
  AboutPortfolioContent copyWith({
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return AboutPortfolioContent(
      mobile: mobile ?? this.mobile,
    );
  }
}

class _AboutContentState extends State<AboutContent> {
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Resume",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            width: 300,
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/ResumePic1.png"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                constraints: BoxConstraints(
                  maxWidth: 400,
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
                      offset:
                          const Offset(5, 5), // Set the offset of the shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/images/ResumePic1.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FullScreenImage("assets/images/ResumePic2.png"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                constraints: BoxConstraints(
                  maxWidth: 400,
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
                      offset:
                          const Offset(5, 5), // Set the offset of the shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/images/ResumePic2.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class AboutPortfolioContent extends StatefulWidget {
  const AboutPortfolioContent({
    super.key,
    required this.mobile,
  });
  final bool mobile;

  @override
  State<AboutPortfolioContent> createState() => _AboutPortfolioContentState();
  AboutPortfolioContent copyWith({
    bool? mobile,
    // Add any other properties you need for the Planet class
  }) {
    return AboutPortfolioContent(
      mobile: mobile ?? this.mobile,
    );
  }
}

class _AboutPortfolioContentState extends State<AboutPortfolioContent> {
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "About This Portfolio",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            width: 300,
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "I have used the flutter framework, a cross-platform UI toolkit, to code this portfolio using VSCode, a popular and versatile code editor. flutter allows me to create beautiful and responsive interfaces for web, mobile, and desktop platforms with a single codebase. All art assets and animations I created in Rive, a powerful and collaborative online tool for vector-based animation. Rive enables me to design smooth and dynamic animations that can be easily integrated with flutter using its runtime library.",
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FullScreenImage(
                      "assets/images/PortfolioDev/RiveSS1.JPG"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                constraints: BoxConstraints(
                  maxWidth: 400,
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
                      offset:
                          const Offset(5, 5), // Set the offset of the shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/images/PortfolioDev/RiveSS1.JPG"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              """I wanted to express by background in game design and show how it can be useful in unrelated projects. 
            Due to my background, I am always thinking about the end user and thinking of ways to keep them engaged 
            even during medial tasks. I chose to put my own spin on the classic space invaders game.""",
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // navigate to a new page with the full screen image
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FullScreenImage(
                      "assets/images/PortfolioDev/RiveSS2.JPG"),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                constraints: BoxConstraints(
                  maxWidth: 400,
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
                      offset:
                          const Offset(5, 5), // Set the offset of the shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/images/PortfolioDev/RiveSS2.JPG"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              """This project gave me the opportunity to look at flutter in a different way and use previously discovered widgets in completely different ways. I believe Rive is an amazing tool to create fun and interactive animations in web apps, it has a lot of potential in the future of all apps and is a useful tool to know. With my previous experience in Adoble Flash Animator I was able to pick it up instantly.""",
              style: GoogleFonts.interTight(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                "View the Code: ",
                style: GoogleFonts.interTight(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                backgroundColor: Color(0xff6e5494),
                label: Text(
                  "GitHub",
                  style: GoogleFonts.interTight(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  html.window.open(
                      'https://github.com/TobyProsser/portfolio_2024',
                      '_blank');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ClimbingAppContent extends StatefulWidget {
  ClimbingAppContent({
    super.key,
    this.globalKey,
    this.open = true,
    required this.mobile,
  });
  final bool mobile;
  late GlobalKey<ClimbingAppContentState>? globalKey;
  late bool open = true;

  @override
  State<ClimbingAppContent> createState() => ClimbingAppContentState();

  ClimbingAppContent copyWith({
    GlobalKey<ClimbingAppContentState>? globalKey,
    bool? open,
    bool? mobile,
  }) {
    return ClimbingAppContent(
      globalKey: globalKey ?? this.globalKey,
      open: open ?? this.open,
      mobile: mobile ?? this.mobile,
    );
  }
}

class ClimbingAppContentState extends State<ClimbingAppContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void loadVideo() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink: "https://www.youtube.com/shorts/ytwmHqqJVoA",
                imagePath: "assets/images/videoCovers/LofiIslandsCover.png",
                vertical: true,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "aqsQiXQv4Sw",
                    key: null,
                  )),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Climbing Gym Leaderboards",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "This climbing app is a unique platform that allows climbers to log their climbs, compare their ranks with others in their gym, and engage in a community of like-minded individuals. The app aims to foster a sense of competition and camaraderie among climbers, attract new customers, and encourage membership subscriptions.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Market Trends",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "With the growing popularity of climbing, there is an increasing demand for platforms that allow climbers to track their progress, compare their performance, and connect with other climbers.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "View the Code: ",
                    style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Color(0xff6e5494),
                    label: Text(
                      "GitHub",
                      style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xfffafafa),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      html.window.open(
                          'https://github.com/TobyProsser/LofiIslands',
                          '_blank');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}

class ClimbingAppDesignContent extends StatefulWidget {
  ClimbingAppDesignContent({
    super.key,
    this.globalKey,
    this.open = true,
    required this.mobile,
  });
  final bool mobile;
  late GlobalKey<ClimbingAppDesignContentState>? globalKey;
  late bool open = true;

  @override
  State<ClimbingAppDesignContent> createState() =>
      ClimbingAppDesignContentState();

  ClimbingAppDesignContent copyWith({
    GlobalKey<ClimbingAppDesignContentState>? globalKey,
    bool? open,
    bool? mobile,
  }) {
    return ClimbingAppDesignContent(
      globalKey: globalKey ?? this.globalKey,
      open: open ?? this.open,
      mobile: mobile ?? this.mobile,
    );
  }
}

class ClimbingAppDesignContentState extends State<ClimbingAppDesignContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void loadVideo() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        widget.mobile
            ? MobileSwap(
                youtubeLink: "https://youtube.com/shorts/VyNX46fG0c4",
                imagePath: "assets/images/videoCovers/LofiIslandsCover.png",
                vertical: true,
              )
            : Padding(
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
                        offset:
                            const Offset(5, 5), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const Center(
                      child: SimpleHtmlYoutubeIframe(
                    youtubeCode: "aqsQiXQv4Sw",
                    key: null,
                  )),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Design",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "The system is a mobile application designed for climbers using React Native. It includes features such as climb logging, leaderboard, climb image uploading, grade setting, and color selection for holds.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Retention",
          style: GoogleFonts.interTight(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 35,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 300,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "In order to encourage users to continue using the app, logging climbs is designed to be fun and enjoyable. Animations and unique UI design makes it enjoyable to use the app. Clicking on dropdown menus trigger springy and smooth movement to display all options. Logging data is usually a boring task, most people can't stick with logging their carolies even with an app. So making it enjoyable while keeping it simple and easy to navigate were of top priority during the design process.",
            style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "View the Code: ",
                    style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Color(0xff6e5494),
                    label: Text(
                      "GitHub",
                      style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xfffafafa),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      html.window.open(
                          'https://github.com/TobyProsser/LofiIslands',
                          '_blank');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
