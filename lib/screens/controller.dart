import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../widgets/scanner.dart';
import 'homescreen.dart';

// ignore: must_be_immutable
class ControllerWidget extends StatefulWidget {
  ControllerWidget({
    super.key,
    this.onLeftArrowTap,
    this.onRightArrowTap,
    this.onUpArrowTap,
    this.onDownArrowTap,
    this.onButton1Tap,
    this.onButton2Tap,
    this.onHomeButtonTap,
    required this.mobile,
  });

  late HomeScreen homeScreen;
  final VoidCallback? onLeftArrowTap;
  final VoidCallback? onRightArrowTap;
  final VoidCallback? onUpArrowTap;
  final VoidCallback? onDownArrowTap;
  final VoidCallback? onButton1Tap;
  final VoidCallback? onButton2Tap;
  final VoidCallback? onHomeButtonTap;

  final bool mobile;

  ControllerWidget copyWith({
    Key? key,
    VoidCallback? onLeftArrowTap,
    VoidCallback? onRightArrowTap,
    VoidCallback? onUpArrowTap,
    VoidCallback? onDownArrowTap,
    VoidCallback? onButton1Tap,
    VoidCallback? onButton2Tap,
    VoidCallback? onHomeButtonTap,
    bool? mobile,
  }) {
    return ControllerWidget(
      key: key,
      onLeftArrowTap: onLeftArrowTap ?? this.onLeftArrowTap,
      onRightArrowTap: onRightArrowTap ?? this.onRightArrowTap,
      onUpArrowTap: onUpArrowTap ?? this.onUpArrowTap,
      onDownArrowTap: onDownArrowTap ?? this.onDownArrowTap,
      onButton1Tap: onButton1Tap ?? this.onButton1Tap,
      onButton2Tap: onButton2Tap ?? this.onButton2Tap,
      onHomeButtonTap: onHomeButtonTap ?? this.onHomeButtonTap,
      mobile: mobile ?? this.mobile,
    );
  }

  @override
  State<ControllerWidget> createState() => ControllerWidgetState();
}

class ControllerWidgetState extends State<ControllerWidget>
    with SingleTickerProviderStateMixin {
  final String riveFileName = 'assets/portfoliocontrol.riv';
  late List<Artboard> artBoards = [];

  late FocusNode _focusNode;

  SMIBool? _upArrow;
  SMIBool? _button1;
  SMIBool? _button2;
  SMIBool? _lilMonster;
  SMIBool? _homeButton;
  SMIBool? _downArrow;
  SMIBool? _leftArrow;
  SMIBool? _rightArrow;

  late StateMachineController _controller;

  late Scanner scanner;

  int inputCount = 0;

  final List<String> tutorials = [
    "",
    "Hit the left arrow to move the ship...",
    "Thats it! now the up arrow to approach the planet...",
    "Hit the up arrow again, or button 2 to open the moon's content...",
    "You can click on images to enlarge them, hit the 'x' in the top-right corner to close the image...",
    "Tap the right arrow to navigate to the next moon...",
    "Finally, hit the down arrow to go back to the planet, and again to go to the solar system."
  ];

  late AnimationController _animationController;

  late Animation<double> _opacity;

  bool flash = false;

  Future<void> _loadRiveFile() async {
    List<String> artboardNames = [
      'ControllerBackground',
      'ControllerDpad',
      'ControllerButton',
      'HomeButton',
      'Grills',
      'Plane',
      'Planet',
      'ControllerFull'
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
      artBoards[7],
      'ControllerStateMachine',
    )!;
    artBoards[7].addController(_controller);
    _upArrow = _controller.findInput<bool>('upArrowDown') as SMIBool;
    _button1 = _controller.findInput<bool>('Button1Down') as SMIBool;
    _button2 = _controller.findInput<bool>('Button2Down') as SMIBool;
    _lilMonster = _controller.findInput<bool>('LilMonster') as SMIBool;
    _homeButton = _controller.findInput<bool>('HomeDown') as SMIBool;
    _downArrow = _controller.findInput<bool>('downArrowDown') as SMIBool;
    _leftArrow = _controller.findInput<bool>('leftArrowDown') as SMIBool;
    _rightArrow = _controller.findInput<bool>('rightArrowDown') as SMIBool;
  }

  HomeScreenState homeScreenState = HomeScreenState();
  @override
  void initState() {
    _loadRiveFile();
    _focusNode = FocusNode();

    _lilMonster?.value = false;

    scanner = Scanner(
      mobile: widget.mobile,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Initialize the Animation with a Tween from 0.0 to 1.0
    _opacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addStatusListener((status) {
      // If the animation is completed, reverse it
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
      // If the animation is dismissed, forward it
      else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    // Start the animation if flash is true
    if (flash) {
      _animationController.forward();
    }

    _loaded = true;

    tutorial("first");
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  bool _loaded = false;

  // A method that changes the boolean value and rebuilds the widget
  void changeBoolean() {
    setState(() {
      _loaded = !_loaded;
    });
  }

  bool showHitBoxes = false;
  bool showTutorial = true;
  List<bool> hitBoxesShowList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  GlobalKey<ScannerState> scannerKey = GlobalKey<ScannerState>();

  void tutorial(String clicked) {
    inputCount += 1;
    int key = 0;
    for (int i = 0; i < hitBoxesShowList.length; i++) {
      hitBoxesShowList[i] = false;
    }

    switch (inputCount) {
      case 1:
        key = 0;
        if (clicked != "first") {
          inputCount = 10;
          showTutorial = false;
          return;
        }
        break;
      case 2:
        key = 1;
        if (clicked != "left") {
          inputCount = 10;
          showTutorial = false;
          return;
        }
        break;
      case 3:
        key = 6;
        if (clicked != "up") {
          inputCount = 10;
          showTutorial = false;
          return;
        }
        break;
      case 4:
        key = 2;
        if (clicked != "button2" && clicked != "up") {
          inputCount = 10;
          showTutorial = false;
          return;
        }
        delayedFunction();
        break;
      case 5:
        key = 2;
        if (clicked != "right") {
          inputCount = 10;
          showTutorial = false;
          return;
        }
        break;
      case 6:
        if (clicked != "right") {
          inputCount = 10;
          showTutorial = false;
          return;
        }
        key = 3;
        break;
      default:
        showTutorial = false;
        return;
    }

    hitBoxesShowList[key] = true;
    flash = true;

    _animationController.forward();
  }

  void delayedFunction() async {
    // Use Future.delayed to wait for two seconds
    await Future.delayed(const Duration(seconds: 2));

    tutorial("right");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double height = MediaQuery.of(context).size.height;

    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: _loaded
          ? Column(
              children: [
                showTutorial
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 350,
                          height: 100,
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
                                blurRadius:
                                    10, // Set the blur radius of the shadow
                                offset: const Offset(
                                    5, 5), // Set the offset of the shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              tutorials[inputCount],
                              style: GoogleFonts.interTight(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                    child: scanner.copyWith(
                      key: scannerKey,
                      width: width,
                    ),
                  ),
                ),
                SizedBox(
                  height: width >= 445.1 ? 200 : width * 0.44934,
                  width: width >= 445.1 ? 445.1 : width,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Stack(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: Rive(
                            artboard: artBoards[7],
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            useArtboardSize: true,
                          ),
                        ),
                        Align(
                          //Left Arrow
                          alignment: const FractionalOffset(0.05, 0.5),
                          child: SizedBox(
                            child: GestureDetector(
                              onTapDown: (details) {
                                _leftArrow?.value = true;

                                widget.onLeftArrowTap?.call();
                                if (inputCount <= 6) {
                                  tutorial("left");
                                }
                              },
                              onTapUp: (details) {
                                _leftArrow?.value = false;
                              },
                              child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return AnimatedOpacity(
                                        // Use the value of the Animation as the opacity
                                        opacity: _opacity.value,
                                        // Use a fixed duration of 300 milliseconds
                                        duration:
                                            const Duration(milliseconds: 300),
                                        // Use a Container widget with amber color as the child
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Container(
                                            width: constraints.maxWidth * .15,
                                            height: constraints.maxHeight * .2,
                                            color: hitBoxesShowList[0]
                                                ? Colors.amber
                                                : Colors.amber.withOpacity(0),
                                          ),
                                        ));
                                  }),
                            ),
                          ),
                        ),
                        Align(
                          //Up Arrow
                          alignment: const FractionalOffset(0.19, 0.2),
                          child: SizedBox(
                            child: GestureDetector(
                              onTapDown: (details) {
                                _upArrow?.value = true;

                                widget.onUpArrowTap?.call();
                                if (inputCount <= 6) {
                                  tutorial("up");
                                }
                              },
                              onTapUp: (details) {
                                _upArrow?.value = false;
                              },
                              child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return AnimatedOpacity(
                                      // Use the value of the Animation as the opacity
                                      opacity: _opacity.value,
                                      // Use a fixed duration of 300 milliseconds
                                      duration:
                                          const Duration(milliseconds: 300),
                                      // Use a Container widget with amber color as the child
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          width: constraints.maxWidth * .1,
                                          height: constraints.maxHeight * .3,
                                          color: hitBoxesShowList[1]
                                              ? Colors.amber
                                              : Colors.amber.withOpacity(0),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Align(
                          //right Arrow
                          alignment: const FractionalOffset(0.3, 0.5),
                          child: SizedBox(
                            child: GestureDetector(
                              onTapDown: (details) {
                                _rightArrow?.value = true;

                                widget.onRightArrowTap?.call();
                                if (inputCount <= 6) {
                                  tutorial("right");
                                }
                              },
                              onTapUp: (details) {
                                _rightArrow?.value = false;
                              },
                              child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return AnimatedOpacity(
                                      // Use the value of the Animation as the opacity
                                      opacity: _opacity.value,
                                      // Use a fixed duration of 300 milliseconds
                                      duration:
                                          const Duration(milliseconds: 300),
                                      // Use a Container widget with amber color as the child
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          width: constraints.maxWidth * .15,
                                          height: constraints.maxHeight * .2,
                                          color: hitBoxesShowList[2]
                                              ? Colors.amber
                                              : Colors.amber.withOpacity(0),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Align(
                          //Down Arrow
                          alignment: const FractionalOffset(0.19, 0.8),
                          child: SizedBox(
                            child: GestureDetector(
                              onTapDown: (details) {
                                _downArrow?.value = true;

                                widget.onDownArrowTap?.call();
                                if (inputCount <= 6) {
                                  tutorial("down");
                                }
                              },
                              onTapUp: (details) {
                                _downArrow?.value = false;
                              },
                              child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return AnimatedOpacity(
                                      // Use the value of the Animation as the opacity
                                      opacity: _opacity.value,
                                      // Use a fixed duration of 300 milliseconds
                                      duration:
                                          const Duration(milliseconds: 300),
                                      // Use a Container widget with amber color as the child
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          width: constraints.maxWidth * .1,
                                          height: constraints.maxHeight * .3,
                                          color: hitBoxesShowList[3]
                                              ? Colors.amber
                                              : Colors.amber.withOpacity(0),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Align(
                          //HomeButton
                          alignment: const FractionalOffset(0.542, 0.17),
                          child: SizedBox(
                            child: GestureDetector(
                              onTapDown: (details) {
                                _homeButton?.value = true;

                                widget.onHomeButtonTap?.call();
                                if (inputCount <= 6) {
                                  tutorial("home");
                                }
                              },
                              onTapUp: (details) {
                                _homeButton?.value = false;
                              },
                              child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return AnimatedOpacity(
                                      // Use the value of the Animation as the opacity
                                      opacity: _opacity.value,
                                      // Use a fixed duration of 300 milliseconds
                                      duration:
                                          const Duration(milliseconds: 300),
                                      // Use a Container widget with amber color as the child
                                      child: Container(
                                        width: constraints.maxWidth * .15,
                                        height: constraints.maxHeight * .34,
                                        color: hitBoxesShowList[4]
                                            ? Colors.amber
                                            : Colors.amber.withOpacity(0),
                                        child: const Card(
                                          color: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Align(
                          //Button1
                          alignment: const FractionalOffset(0.74, 0.79),
                          child: SizedBox(
                            child: GestureDetector(
                              onTapDown: (details) {
                                _button1?.value = true;
                                widget.onButton1Tap?.call();
                              },
                              onTapUp: (details) {
                                _button1?.value = false;
                              },
                              child: Container(
                                width: constraints.maxWidth * .15,
                                height: constraints.maxHeight * .34,
                                color: hitBoxesShowList[5]
                                    ? Colors.amber
                                    : Colors.amber.withOpacity(0),
                                child: const Card(
                                  color: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          //Button2
                          alignment: const FractionalOffset(0.96, 0.79),
                          child: SizedBox(
                            child: GestureDetector(
                              onTapDown: (details) {
                                _button2?.value = true;

                                widget.onButton2Tap?.call();
                                if (inputCount <= 6) {
                                  tutorial("button2");
                                }
                              },
                              onTapUp: (details) {
                                _button2?.value = false;
                              },
                              child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return AnimatedOpacity(
                                      // Use the value of the Animation as the opacity
                                      opacity: _opacity.value,
                                      // Use a fixed duration of 300 milliseconds
                                      duration:
                                          const Duration(milliseconds: 300),
                                      // Use a Container widget with amber color as the child
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          width: constraints.maxWidth * .15,
                                          height: constraints.maxHeight * .34,
                                          color: hitBoxesShowList[6]
                                              ? Colors.amber
                                              : Colors.amber.withOpacity(0),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
    );
  }

  // A map to store the key codes and the corresponding directions
  final Map<int, String> _keyMap = {
    LogicalKeyboardKey.keyW.keyId: 'Up',
    LogicalKeyboardKey.keyA.keyId: 'Left',
    LogicalKeyboardKey.keyS.keyId: 'Down',
    LogicalKeyboardKey.keyD.keyId: 'Right',
    LogicalKeyboardKey.arrowUp.keyId: 'Up',
    LogicalKeyboardKey.arrowLeft.keyId: 'Left',
    LogicalKeyboardKey.arrowDown.keyId: 'Down',
    LogicalKeyboardKey.arrowRight.keyId: 'Right',
    LogicalKeyboardKey.space.keyId: 'Space',
    LogicalKeyboardKey.enter.keyId: 'Enter',
    LogicalKeyboardKey.escape.keyId: 'Esc',
    LogicalKeyboardKey.digit1.keyId: '1',
    LogicalKeyboardKey.digit2.keyId: '2',
  };

// A list to store the pressed directions
  final List<String> _pressedDirections = [];

  final controller = ControllerWidget(mobile: false);
// A method to handle the key events
  void _handleKeyEvent(RawKeyEvent event) {
    // Get the key code of the event
    final int keyCode = event.logicalKey.keyId;

    // Check if the key code is in the map
    if (_keyMap.containsKey(keyCode)) {
      // Get the direction of the key code
      final String direction = _keyMap[keyCode]!;

      // Check if the event is a key down event
      if (event is KeyDownEvent) {
        if (inputCount <= 6) {
          if (direction == 'Up') {
            tutorial("up");
          } else if (direction == 'Left') {
            tutorial("left");
          } else if (direction == 'Down') {
            tutorial("down");
          } else if (direction == 'Right') {
            tutorial("right");
          } else if (direction == 'Space' || direction == '1') {
          } else if (direction == 'Enter' || direction == '2') {
            tutorial("button2");
          } else if (direction == 'Esc') {
            tutorial("home");
          }
        }
      }
    }
  }
}
