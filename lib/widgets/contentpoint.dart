import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_2024/screens/homescreen.dart';
import 'package:rive/rive.dart';

import 'flagwidget.dart';

// The stateful widget that contains the container and the button
// ignore: must_be_immutable
class ContainerWidget extends StatefulWidget {
  ContainerWidget({
    super.key,
    GlobalKey<ContainerWidgetState>? globalKey,
    this.selected = false,
    this.open = false,
    this.screenWidth = 0.0,
    this.screenHeight = 0.0,
    this.widthAnimation = 0.0,
    this.heightAnimation = 0.0,
    this.topStart = 0.0,
    this.leftStart = 0.0,
    this.atThisPlanet = false,
    this.someContentIsOpen = false,
    required this.content,
    required this.title,
    required this.hsKey,
    required this.index,
    required this.mobile,
  });

  @override
  ContainerWidgetState createState() => ContainerWidgetState();

  final GlobalKey<HomeScreenState> hsKey;
  late bool selected;
  late bool open;
  late bool atThisPlanet;

  final bool mobile;

  late bool someContentIsOpen;

  final String title;
  final int index;

  double screenWidth;
  double screenHeight;

  late double widthAnimation;
  late double heightAnimation;
  final Widget content;

  late double topStart;
  late double leftStart;

  late GlobalKey<ContainerWidgetState> globalKey =
      GlobalKey<ContainerWidgetState>();
  ContainerWidget copyWith({
    Key? key,
    bool? selected,
    bool? open,
    bool? atThisPlanet,
    bool? someContentIsOpen,
    String? title,
    double? screenWidth,
    double? screenHeight,
    double? widthAnimation,
    double? heightAnimation,
    Widget? content,
    double? topStart,
    double? leftStart,
    GlobalKey<ContainerWidgetState>? globalKey,
    GlobalKey<HomeScreenState>? hsKey,
    int? index,
    // Add any other properties you need for the Planet class
  }) {
    return ContainerWidget(
      globalKey: globalKey ?? this.globalKey,
      selected: selected ?? this.selected,
      open: open ?? this.open,
      someContentIsOpen: someContentIsOpen ?? this.someContentIsOpen,
      screenHeight: screenHeight ?? this.screenHeight,
      screenWidth: screenWidth ?? this.screenWidth,
      heightAnimation: heightAnimation ?? this.heightAnimation,
      widthAnimation: widthAnimation ?? this.widthAnimation,
      content: content ?? this.content,
      topStart: topStart ?? this.topStart,
      leftStart: leftStart ?? this.leftStart,
      atThisPlanet: atThisPlanet ?? this.atThisPlanet,
      title: title ?? this.title, hsKey: hsKey ?? this.hsKey,
      index: index ?? this.index, mobile: mobile ?? mobile,
      // Assign any other properties you need for the Planet class
    );
  }
}

// The state of the container widget
class ContainerWidgetState extends State<ContainerWidget>
    with SingleTickerProviderStateMixin {
  final String riveFileName = 'assets/portfoliocontrol.riv';
  late StateMachineController _controller;
  late List<Artboard> artBoards = [];
  late bool complete = false;
  Future<void> _loadRiveFile() async {
    List<String> artboardNames = [
      'floatingTitleHolder',
    ];

    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile.import(bytes);
    for (int i = 0; i < artboardNames.length; i++) {
      Artboard? artboard = file.artboardByName(artboardNames[i]);
      setState(() {
        artBoards.add(artboard!);
      });
    }

    _controller = StateMachineController.fromArtboard(
      artBoards[0],
      'State Machine 1',
    )!;
    artBoards[0].addController(_controller);
    complete = true;
  }

  // A controller for the animation
  late AnimationController animController;
  // An animation for the container's width
  late Animation<double> _widthAnimation;
  // An animation for the container's height
  late Animation<double> _heightAnimation;

  late Animation<double> _borderAnimation;

  late Animation<double> _topAnimation;
  late Animation<double> _leftAnimation;

  // An animation for the container's border radius
  late Animation<BorderRadius?> _borderRadiusAnimation;

  late int point = 0;
  int index = 0;
  late bool isSelected = false;

  @override
  void initState() {
    _loadRiveFile();
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    animController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void initAnimation() {
    try {
      // Initialize the controller with a duration of one second
      animController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );
      // Initialize the width animation from 50 to 300 pixels
      Tween<double> tween =
          Tween<double>(begin: 30, end: (widget.screenWidth * .9));
      // Initialize the height animation from 50 to 200 pixels
      Tween<double> tween1 =
          Tween<double>(begin: 30, end: (widget.screenHeight * 2) / 3);
      Tween<double> tween2 = Tween<double>(begin: widget.topStart, end: (25));
      Tween<double> tween3 = Tween<double>(
          begin: widget.leftStart, end: (widget.screenWidth * .05));
      Tween<double>(begin: widget.topStart, end: (widget.screenHeight * .1));
      Tween<double> tween4 = Tween<double>(begin: 15, end: 4);

      _widthAnimation = tween.animate(
        CurvedAnimation(
          parent: animController,
          curve: Curves.easeOut,
        ),
      );
      _heightAnimation = tween1.animate(
        CurvedAnimation(
          parent: animController,
          curve: Curves.easeOut,
        ),
      );

      _topAnimation = tween2.animate(
        CurvedAnimation(
          parent: animController,
          curve: Curves.easeOut,
        ),
      );
      _leftAnimation = tween3.animate(
        CurvedAnimation(
          parent: animController,
          curve: Curves.easeOut,
        ),
      );

      _borderAnimation = tween4.animate(
        CurvedAnimation(
          parent: animController,
          curve: Curves.easeOut,
        ),
      );

      // Initialize the border radius animation from 25 to 0 pixels
      _borderRadiusAnimation = BorderRadiusTween(
        begin: BorderRadius.circular(25),
        end: BorderRadius.circular(20),
      ).animate(animController);
      // Add a listener to rebuild the widget when the animation changes
      animController.addListener(() {
        setState(() {});
      });
    } catch (e) {
      print("ERROR: " + e.toString());
    }
  }

  @override
  void didUpdateWidget(ContainerWidget oldWidget) {
    if (widget.open != oldWidget.open) {
      if (widget.open) {
        animController.forward();
      } else {
        animController.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  GlobalKey<FlagWidgetState> flagKey = GlobalKey<FlagWidgetState>();

  @override
  Widget build(BuildContext context) {
    return widget.atThisPlanet && !widget.someContentIsOpen
        ? Positioned(
            top: _topAnimation.value +
                widget.screenHeight *
                    .075, // adjust the top position based on the index
            left: _leftAnimation
                .value, // adjust the left position based on the index
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                (widget.selected && !widget.open)
                    ? Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(228, 18, 255, 247),
                        ),
                      )
                    : Container(),

                // The container with the animations
                Align(
                  alignment: const FractionalOffset(0, 1),
                  child: GestureDetector(
                    onTap: () {
                      if (animController.isCompleted) {
                        //animController.reverse();
                      } else {
                        //animController.forward();
                      }
                    },
                    child: Container(
                      width: _widthAnimation.value,
                      height: _heightAnimation.value,
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue
                            : const Color.fromARGB(255, 245, 255, 255),
                        border: Border.all(
                          color: const Color.fromARGB(255, 216, 179, 176),
                          width: _borderAnimation.value,
                        ),
                        borderRadius: _borderRadiusAnimation.value,
                      ),
                      child: widget.open ? widget.content : Container(),
                    ),
                  ),
                ),
                widget.atThisPlanet && !widget.open && !widget.someContentIsOpen
                    ? GestureDetector(
                        onTapDown: (_) {
                          widget.hsKey.currentState?.curPoint = widget.index;
                          widget.hsKey.currentState?.toggleContentPoint();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: SizedBox(
                            width: 400,
                            height: 150,
                            child: Stack(
                              children: [
                                //fLOATING MOON TITLE
                                Rive(
                                  artboard: artBoards[0],
                                  alignment: Alignment.center,
                                  useArtboardSize: true,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(80, 35, 0, 0),
                                  child: Text(
                                    widget.title,
                                    style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromARGB(255, 45, 45, 45),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.purple,
                      ),
              ],
            ),
          )
        : const SizedBox();
  }

  void startAnimation() {
    // Reset and forward the controller
    animController.reset();
    animController.forward();
  }
}
