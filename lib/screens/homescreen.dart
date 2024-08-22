import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rive/rive.dart';

import '../widgets/content.dart';
import '../widgets/planet.dart';
import 'dart:math';

import 'controller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    this.hsKey,
  });

  late ControllerWidget controllerWidget;
  final GlobalKey<HomeScreenState>? hsKey;
  List<String> scannerTexts = [
    'Game Dev',
    'BlackSwan Intel',
    'Fathom C.',
    'About'
  ];

  int curPlanet = 2;

  late bool loaded;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<double> _animationY;
  late Animation<double> _animationPlanet;
  late Animation<double> _animationPlanet1;
  late Animation<double> _animationPlanet2;
  late Animation<double> _animationPlanet3;
  late Animation<double> _animationPlanetY;
  late Animation<double> _animationPlanet1Y;
  late Animation<double> _animationPlanet2Y;
  late Animation<double> _animationPlanet3Y;
  late AnimationController _animController;
  late AnimationController _animControllerY;
  late AnimationController _animControllerPlanetSize;
  late AnimationController _animControllerPlanetSizeFast;
  late AnimationController _animControllerPlanetY;
  late AnimationController _animControllerPlanetNotY;

  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  final String riveFileName = 'assets/portfoliocontrol.riv';
  late List<Artboard> artBoards = [];
  late bool complete = false;

  late AudioPlayer _audioPlayer;

  final List<double> planetPosX = [.15, .45, .67, .86];
  final List<double> planetPosY = [.1, .35, .1, .43];
  final List<double> planetSize = [.225, .14, .16, .18];
  double planesX = .5;
  double planesY = .65;

  late StateMachineController _starscontroller;
  late StateMachineController _shootingStarcontroller;

  double shootingStarHeight = .4;
  double shootingStarRotaiton = 35;

  SMIBool? fireBool;
  SMIBool? shootingStarTrigger;
  late StateMachineController _fireController;

  GlobalKey<ControllerWidgetState> controllerKey =
      GlobalKey<ControllerWidgetState>();

  final FocusNode _focusNode = FocusNode();

  Future<void> _loadRiveFile() async {
    List<String> artboardNames = [
      'Plane',
      'LazerFlash',
      'Stars',
      'Screen',
      'ShootingStar',
      'Horizontal_Stars',
    ];

    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile.import(bytes);
    for (int i = 0; i < artboardNames.length; i++) {
      Artboard? artBoard = file.artboardByName(artboardNames[i]);
      setState(() {
        artBoards.add(artBoard!);
      });
    }

    _starscontroller = StateMachineController.fromArtboard(
      artBoards[2],
      'StarStateMachine',
    )!;
    artBoards[2].addController(_starscontroller);

    _fireController = StateMachineController.fromArtboard(
      artBoards[1],
      'St_Machine',
    )!;
    artBoards[1].addController(_fireController);

    _shootingStarcontroller = StateMachineController.fromArtboard(
      artBoards[4],
      'State Machine 1',
    )!;
    artBoards[4].addController(_shootingStarcontroller);

    fireBool = _fireController.findInput<bool>('Fire') as SMIBool;

    shootingStarTrigger =
        _shootingStarcontroller.findInput<bool>('TriggerStar') as SMIBool;

    runEveryXSeconds(shootingStarOffset);

    complete = true;
  }

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
    _focusNode.requestFocus();
    simulateLoading();
    //initPlanets();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: planesX, end: planetPosX[widget.curPlanet])
            .animate(_animController)
          ..addListener(() {
            setState(() {});
          });

    _animControllerY = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animationY = Tween<double>(
      begin: planesY,
      end: -1,
    ).animate(_animControllerY)
      ..addListener(() {
        setState(() {});
      });

    _animControllerPlanetSize = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animControllerPlanetSizeFast = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animationPlanet = Tween<double>(
      begin: planetSize[0],
      end: 0,
    ).animate(_animControllerPlanetSize)
      ..addListener(() {
        setState(() {});
      });

    _animationPlanet1 = Tween<double>(
      begin: planetSize[1],
      end: 0,
    ).animate(_animControllerPlanetSize)
      ..addListener(() {
        setState(() {});
      });

    _animationPlanet2 = Tween<double>(
      begin: planetSize[2],
      end: 0,
    ).animate(_animControllerPlanetSize)
      ..addListener(() {
        setState(() {});
      });

    _animationPlanet3 = Tween<double>(
      begin: planetSize[3],
      end: 0,
    ).animate(_animControllerPlanetSize)
      ..addListener(() {
        setState(() {});
      });
    _animControllerPlanetY = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animControllerPlanetNotY = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animationPlanetY = Tween<double>(
      begin: planetPosY[0],
      end: planetPosY[0] + 1,
    ).animate(_animControllerPlanetNotY)
      ..addListener(() {
        setState(() {});
      });
    _animationPlanet1Y = Tween<double>(
      begin: planetPosY[1],
      end: planetPosY[1] + 1,
    ).animate(_animControllerPlanetNotY)
      ..addListener(() {
        setState(() {});
      });
    _animationPlanet2Y = Tween<double>(
      begin: planetPosY[2],
      end: planetPosY[2] + 1,
    ).animate(_animControllerPlanetNotY)
      ..addListener(() {
        setState(() {});
      });
    _animationPlanet3Y = Tween<double>(
      begin: planetPosY[3],
      end: planetPosY[3] + 1,
    ).animate(_animControllerPlanetNotY)
      ..addListener(() {
        setState(() {});
      });

    _loadRiveFile();

    widget.loaded = true;

    widget.controllerWidget = ControllerWidget(
      mobile: isWebMobile,
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void updateScanner() {
    controllerKey.currentState?.scannerKey.currentState?.scannerText =
        widget.scannerTexts[widget.curPlanet];
  }

  void movePlane() async {
    _animController.reset();

    if (widget.curPlanet < 0) {
      widget.curPlanet = planetPosX.length - 1;
    } else if (widget.curPlanet > planetPosX.length - 1) {
      widget.curPlanet = 0;
    }

    _animation = Tween<double>(
      begin: planesX,
      end: planetPosX[widget.curPlanet],
    ).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    planesX = planetPosX[widget.curPlanet];

    for (int i = 0; i < planets.length; i++) {
      // Get the key of the first planet in the list
      GlobalKey<PlanetState>? key = planetKeys[i];
// Get the state of the widget using the key
      PlanetState? state = key.currentState;
// Call the function on the state
      state?.updateSelectedBool(planesX: planesX, planetsX: planetPosX[i]);
    }
    await _animController.forward();
  }

  List<bool> staticPlanet = [true, true, true, true];
  bool atPlanet = false;
  int curPoint = 0;

  void moveToPlanet() {
    _animControllerY.reset();
    if (widget.curPlanet == 0) {
      _animationPlanet = enlargePlanet(0, _animationPlanet);
      _animationPlanetY = movePlanetNotDown(0, _animationPlanetY);

      _animationPlanet1 = shrinkPlanet(1, _animationPlanet1);
      _animationPlanet1Y = movePlanetDown(1, _animationPlanet1Y);

      _animationPlanet2 = shrinkPlanet(2, _animationPlanet2);
      _animationPlanet2Y = movePlanetDown(2, _animationPlanet2Y);

      _animationPlanet3 = shrinkPlanet(3, _animationPlanet3);
      _animationPlanet3Y = movePlanetDown(3, _animationPlanet3Y);
    } else if (widget.curPlanet == 1) {
      _animationPlanet = shrinkPlanet(0, _animationPlanet);
      _animationPlanetY = movePlanetDown(0, _animationPlanetY);

      _animationPlanet1 = enlargePlanet(1, _animationPlanet1);
      _animationPlanet1Y = movePlanetNotDown(1, _animationPlanet1Y);

      _animationPlanet2 = shrinkPlanet(2, _animationPlanet2);
      _animationPlanet2Y = movePlanetDown(2, _animationPlanet2Y);

      _animationPlanet3 = shrinkPlanet(3, _animationPlanet3);
      _animationPlanet3Y = movePlanetDown(3, _animationPlanet3Y);
    } else if (widget.curPlanet == 2) {
      _animationPlanet = shrinkPlanet(0, _animationPlanet);
      _animationPlanetY = movePlanetDown(0, _animationPlanetY);

      _animationPlanet1 = shrinkPlanet(1, _animationPlanet1);
      _animationPlanet1Y = movePlanetDown(1, _animationPlanet1Y);

      _animationPlanet2 = enlargePlanet(2, _animationPlanet2);
      _animationPlanet2Y = movePlanetNotDown(2, _animationPlanet2Y);

      _animationPlanet3 = shrinkPlanet(3, _animationPlanet3);
      _animationPlanet3Y = movePlanetDown(3, _animationPlanet3Y);
    } else if (widget.curPlanet == 3) {
      _animationPlanet = shrinkPlanet(0, _animationPlanet);
      _animationPlanetY = movePlanetDown(0, _animationPlanetY);

      _animationPlanet1 = shrinkPlanet(1, _animationPlanet1);
      _animationPlanet1Y = movePlanetDown(1, _animationPlanet1Y);

      _animationPlanet2 = shrinkPlanet(2, _animationPlanet2);
      _animationPlanet2Y = movePlanetDown(2, _animationPlanet2Y);

      _animationPlanet3 = enlargePlanet(3, _animationPlanet3);
      _animationPlanet3Y = movePlanetNotDown(3, _animationPlanet3Y);
    } else {
      return;
    }

    GlobalKey<PlanetState>? curKey = planetKeys[widget.curPlanet];
    curKey.currentState?.animateFlags();

    _animControllerPlanetSize.forward();
    _animControllerPlanetSizeFast.forward();
    _animControllerPlanetY.forward();
  }

  List<GlobalKey<PlanetState>> planetKeys = [
    GlobalKey<PlanetState>(),
    GlobalKey<PlanetState>(),
    GlobalKey<PlanetState>(),
    GlobalKey<PlanetState>(),
  ];

  List<bool> contentOpen = [
    false,
    false,
    false,
    false,
  ];
  List<Planet> planets = [
    Planet(
      selected: false,
      curPoint: 0,
      screenHeight: 0,
      screenWidth: 0,
      planetLookNum: 0,
      contentClasses: [
        UnityContent(
          mobile: false,
        ),
        UnrealContent(
          mobile: false,
        ),
      ],
      onPlanetClick: () {},
      atThisPlanet: false,
      homeScreenKey: GlobalKey<HomeScreenState>(),
      mobile: false,
    ),
    Planet(
      selected: false,
      curPoint: 0,
      screenHeight: 0,
      screenWidth: 0,
      planetLookNum: 1,
      contentClasses: [
        const BsiAboutContent(
          mobile: false,
        ),
        BSIDevContent(
          mobile: false,
        ),
      ],
      onPlanetClick: () {},
      atThisPlanet: false,
      homeScreenKey: GlobalKey<HomeScreenState>(),
      mobile: false,
    ),
    Planet(
      selected: false,
      curPoint: 0,
      screenHeight: 0,
      screenWidth: 0,
      planetLookNum: 3,
      contentClasses: [
        ClimbingAppContent(
          mobile: false,
        ),
        ClimbingAppDesignContent(
          mobile: false,
        ),
        ReviewBookDesignContent(
          mobile: false,
        ),
      ],
      onPlanetClick: () {},
      atThisPlanet: false,
      homeScreenKey: GlobalKey<HomeScreenState>(),
      mobile: false,
    ),
    Planet(
      selected: false,
      curPoint: 0,
      screenHeight: 0,
      screenWidth: 0,
      planetLookNum: 2,
      contentClasses: const [
        AboutPortfolioContent(
          mobile: false,
        ),
        GalleryContent(
          mobile: false,
        ),
        AboutContent(
          mobile: false,
        ),
      ],
      onPlanetClick: () {},
      atThisPlanet: false,
      homeScreenKey: GlobalKey<HomeScreenState>(),
      mobile: false,
    ),
  ];

  void clickedPlanet(int planet) async {
    if (!atPlanet) {
      widget.curPlanet = planet;
      movePlane();

      await Future.delayed(const Duration(seconds: 1));
      //_playButtonSound();
      atPlanet = true;
      moveToPlanet();
      updateScanner();
    } else {
      toggleContentPoint();
    }
  }

  void initPlanets() {
    List<Planet> newPlanets = [];
    for (int i = 0; i < planets.length; i++) {
      // Copy the old widget's properties and assign the new key
      newPlanets.add(planets[i].copyWith(
          key: planetKeys[i],
          selected: planesX == planetPosX[i],
          curPoint: curPoint));
    }

// Replace the old list with the new one
    planets = newPlanets;
  }

  void shootingStarOffset() {
    var rng = Random().nextDouble(); // Value is >= 0.0 and < 1.0.
    shootingStarHeight = rng;
    shootingStarRotation();
    setState(() {});
    if (shootingStarTrigger?.value == true) {
      shootingStarTrigger?.value = false;
    } else {
      shootingStarTrigger?.value = true;
    }
  }

  void shootingStarRotation() {
    var rng = Random().nextDouble() * 360;
    shootingStarRotaiton = rng;
  }

  void runEveryXSeconds(Function f) {
    // generate a random integer between 2 and 10
    var x = Random().nextInt(9) + 2;
    // create a timer that repeats every x seconds
    // ignore: unused_local_variable
    var timer = Timer.periodic(Duration(seconds: x), (timer) {
      // run the function
      f();
    });
  }

  void selectPoint() {
    GlobalKey<PlanetState>? curKey = planetKeys[widget.curPlanet];
    curKey.currentState?.point = curPoint;
    curKey.currentState?.setState(() {});
  }

  void toggleContentPoint() {
    //This is causing this widget to unmount, WHY?
    //see if callback functions can help
    GlobalKey<PlanetState>? curKey = planetKeys[widget.curPlanet];
    if (curKey.currentState?.openBools[curPoint] == true) {
      curKey.currentState?.openBools[curPoint] = false;
      contentOpen[curPoint] = false;
    } else {
      curKey.currentState?.openBools[curPoint] = true;
      contentOpen[curPoint] = true;
    }

    curKey.currentState?.findStackOrder();
    curKey.currentState?.setState(() {});
  }

  void moveBackFromPlanet() {
    _animControllerY.reverse();
    _animControllerPlanetSize.reverse();
    _animControllerPlanetSizeFast.reverse();
    _animControllerPlanetY.reverse();
  }

  Animation<double> enlargePlanet(int planet, Animation planetSizeAnim) {
    planetSizeAnim = Tween<double>(
      begin: planetSize[planet],
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animControllerPlanetSize,
        curve: Curves.easeIn,
      ),
    )..addListener(
        () {
          setState(() {});
        },
      );

    staticPlanet[planet] = false;
    _animControllerY.forward();
    return planetSizeAnim as Animation<double>;
  }

  Animation<double> shrinkPlanet(int planet, Animation planetSizeAnim) {
    planetSizeAnim = Tween<double>(
      begin: planetSize[planet],
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animControllerPlanetSizeFast,
        curve: Curves.easeIn,
      ),
    )..addListener(
        () {
          setState(() {});
        },
      );

    staticPlanet[planet] = false;
    return planetSizeAnim as Animation<double>;
  }

  Animation<double> movePlanetDown(int planet, Animation planetYanim) {
    planetYanim = Tween<double>(
      begin: planetPosY[planet],
      end: planetPosY[planet] + 1.5,
    ).animate(_animControllerPlanetY)
      ..addListener(() {
        setState(() {});
      });

    staticPlanet[planet] = false;
    return planetYanim as Animation<double>;
  }

  Animation<double> movePlanetNotDown(int planet, Animation planetYanim) {
    planetYanim = Tween<double>(
      begin: planetPosY[planet],
      end: planetPosY[planet] + 1.5,
    ).animate(_animControllerPlanetNotY)
      ..addListener(() {
        setState(() {});
      });

    staticPlanet[planet] = false;
    return planetYanim as Animation<double>;
  }

  // Define a boolean variable to track the current sound
  bool _isSound1 = true;

  Future<String> getAudioDownloadURL(String fileName) async {
    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
    String downloadURL = await storageRef.getDownloadURL();
    return downloadURL;
  }

  Future<void> playSound(String sound) async {
    try {
      if (sound == "button") {
        if (_isSound1) {
          String url1 = await getAudioDownloadURL("Select1.wav");
          // Play the first sound
          await _audioPlayer.setUrl(url1);
          _audioPlayer.play();
        } else {
          String url1 = await getAudioDownloadURL("assets/sounds/Select2.wav");
          // Play the second sound
          await _audioPlayer.setUrl(url1);
          _audioPlayer.play();
        }

        setState(() {
          _isSound1 = !_isSound1;
        });
      } else {
        String url = await getAudioDownloadURL(sound);
        await _audioPlayer.setFilePath(url);
        _audioPlayer.play();
      }
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  int progress = 0;
  bool loading = true;

  void simulateLoading() async {
    // Loop from 0 to 100 with a 30ms delay
    for (int i = 0; i <= 20; i++) {
      await Future.delayed(const Duration(milliseconds: 30));
      // Update the progress and the state
      setState(() {
        progress = i;
      });

      print("Loader: " + i.toString());
    }
    // Set the loading status to false
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return complete
        ? Focus(
            focusNode: _focusNode,
            onKeyEvent: (FocusNode node, KeyEvent event) {
              _handleKeyEvent(event);
              return KeyEventResult.handled;
            },
            child: Scaffold(
              body: Builder(
                builder: (context) {
                  return Stack(
                    children: [
                      FractionallySizedBox(
                        //Background
                        heightFactor: 1,
                        widthFactor: 1,
                        child: Container(
                          color: const Color(0xFF001B27),
                        ),
                      ),
                      //Stars
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Transform.rotate(
                          angle: width > height ? 110 : 0,
                          child: Rive(
                              artboard:
                                  width < height ? artBoards[2] : artBoards[5],
                              alignment: Alignment.center,
                              useArtboardSize: false,
                              fit: BoxFit.fill),
                        ),
                      ),
                      //SHOOTING STAR
                      Align(
                        alignment: FractionalOffset(.5, shootingStarHeight),
                        child: FractionallySizedBox(
                          heightFactor: .10,
                          child: Transform.rotate(
                            angle: shootingStarRotaiton,
                            child: Rive(
                              artboard: artBoards[4],
                              alignment: Alignment.topRight,
                              useArtboardSize: false,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        fit: StackFit.expand,
                        children: [
                          //Planet1
                          FractionallySizedBox(
                            heightFactor: staticPlanet[0]
                                ? planetSize[0] + .25
                                : _animationPlanet.value + .25,
                            widthFactor: staticPlanet[0]
                                ? planetSize[0] - (width > 1100 ? .05 : 0.001)
                                : (_animationPlanet.value -
                                            (width > 1100 ? .05 : 0.001)) >=
                                        0
                                    ? (_animationPlanet.value -
                                        (width > 1100 ? .05 : 0.001))
                                    : 0,
                            alignment: staticPlanet[0]
                                ? FractionalOffset(planetPosX[0], planetPosY[0])
                                : FractionalOffset(
                                    planetPosX[0], _animationPlanetY.value),
                            child: Container(
                              child: planets[0].copyWith(
                                contentClasses: [
                                  UnityContent(
                                    mobile: isWebMobile,
                                  ),
                                  UnrealContent(
                                    mobile: isWebMobile,
                                  ),
                                ],
                                key: planetKeys[0],
                                selected: planesX == planetPosX[0],
                                homeScreenKey: widget.hsKey,
                                curPoint: curPoint,
                                screenWidth: width,
                                screenHeight: height,
                                onPlanetClick: () => clickedPlanet(0),
                                atThisPlanet: widget.curPlanet == 0 && atPlanet
                                    ? true
                                    : false,
                                mobile: isWebMobile,
                              ),
                            ),
                          ),
                          //planet2
                          FractionallySizedBox(
                            heightFactor: staticPlanet[1]
                                ? planetSize[1] + .25
                                : _animationPlanet1.value + .25,
                            widthFactor: staticPlanet[1]
                                ? planetSize[1] - (width > 1100 ? .05 : 0.001)
                                : (_animationPlanet1.value -
                                            (width > 1100 ? .05 : 0.001)) >=
                                        0
                                    ? (_animationPlanet1.value -
                                        (width > 1100 ? .05 : 0.001))
                                    : 0,
                            alignment: staticPlanet[1]
                                ? FractionalOffset(planetPosX[1], planetPosY[1])
                                : FractionalOffset(
                                    planetPosX[1], _animationPlanet1Y.value),
                            child: planets[1].copyWith(
                              key: planetKeys[1],
                              contentClasses: [
                                BsiAboutContent(
                                  mobile: isWebMobile,
                                ),
                                BSIDevContent(
                                  mobile: isWebMobile,
                                ),
                              ],
                              selected: planesX == planetPosX[1],
                              homeScreenKey: widget.hsKey,
                              mobile: isWebMobile,
                              curPoint: curPoint,
                              screenWidth: width,
                              screenHeight: height,
                              onPlanetClick: () => clickedPlanet(1),
                              atThisPlanet: widget.curPlanet == 1 && atPlanet
                                  ? true
                                  : false,
                            ),
                          ),
                          //planet3
                          FractionallySizedBox(
                            heightFactor: staticPlanet[2]
                                ? planetSize[2] + .25
                                : _animationPlanet2.value + .25,
                            widthFactor: staticPlanet[2]
                                ? planetSize[2] - (width > 1100 ? .05 : 0.001)
                                : (_animationPlanet2.value -
                                            (width > 1100 ? .05 : 0.001)) >=
                                        0
                                    ? (_animationPlanet2.value -
                                        (width > 1100 ? .05 : 0.001))
                                    : 0,
                            alignment: staticPlanet[2]
                                ? FractionalOffset(planetPosX[2], planetPosY[2])
                                : FractionalOffset(
                                    planetPosX[2], _animationPlanet2Y.value),
                            child: Container(
                              child: planets[2].copyWith(
                                key: planetKeys[2],
                                contentClasses: [
                                  ClimbingAppContent(
                                    mobile: isWebMobile,
                                  ),
                                  ClimbingAppDesignContent(
                                    mobile: isWebMobile,
                                  ),
                                  ReviewBookDesignContent(
                                    mobile: isWebMobile,
                                  ),
                                ],
                                selected: planesX == planetPosX[2],
                                homeScreenKey: widget.hsKey,
                                curPoint: curPoint,
                                mobile: isWebMobile,
                                screenWidth: width,
                                screenHeight: height,
                                onPlanetClick: () => clickedPlanet(2),
                                atThisPlanet: widget.curPlanet == 2 && atPlanet
                                    ? true
                                    : false,
                              ),
                            ),
                          ),
                          //planet4
                          FractionallySizedBox(
                            heightFactor: staticPlanet[3]
                                ? planetSize[3] + .25
                                : _animationPlanet3.value + .25,
                            widthFactor: staticPlanet[3]
                                ? planetSize[3] - (width > 1100 ? .05 : 0.001)
                                : (_animationPlanet3.value -
                                            (width > 1100 ? .05 : 0.001)) >=
                                        0
                                    ? (_animationPlanet3.value -
                                        (width > 1100 ? .05 : 0.001))
                                    : 0,
                            alignment: staticPlanet[3]
                                ? FractionalOffset(planetPosX[3], planetPosY[3])
                                : FractionalOffset(
                                    planetPosX[3], _animationPlanet3Y.value),
                            child: SizedBox(
                              height: 10,
                              width: 10,
                              child: planets[3].copyWith(
                                key: planetKeys[3],
                                contentClasses: [
                                  AboutPortfolioContent(
                                    mobile: isWebMobile,
                                  ),
                                  GalleryContent(
                                    mobile: isWebMobile,
                                  ),
                                  AboutContent(
                                    mobile: isWebMobile,
                                  ),
                                ],
                                selected: planesX == planetPosX[3],
                                homeScreenKey: widget.hsKey,
                                curPoint: curPoint,
                                mobile: isWebMobile,
                                screenWidth: width,
                                screenHeight: height,
                                onPlanetClick: () => clickedPlanet(3),
                                atThisPlanet: widget.curPlanet == 3 && atPlanet
                                    ? true
                                    : false,
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            //Plane
                            heightFactor: .18,
                            widthFactor: .18,
                            alignment: FractionalOffset(
                              _animation.value,
                              _animationY.value,
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const FractionalOffset(.5, 0),
                                  child: FractionallySizedBox(
                                    heightFactor: .45,
                                    child: Rive(
                                      artboard: artBoards[1],
                                      alignment: Alignment.topRight,
                                      useArtboardSize: true,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const FractionalOffset(.5, .9),
                                  child: FractionallySizedBox(
                                    heightFactor: .55,
                                    child: Rive(
                                      artboard: artBoards[0],
                                      alignment: Alignment.bottomCenter,
                                      useArtboardSize: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      //SCREEN
                      IgnorePointer(
                        ignoring: true,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Rive(
                              artboard: artBoards[3],
                              alignment: Alignment.center,
                              useArtboardSize: false,
                              fit: BoxFit.fill),
                        ),
                      ),
                      //Controller
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: widget.controllerWidget.copyWith(
                            key: controllerKey,
                            onLeftArrowTap: () {
                              playSound("button");
                              if (!atPlanet) {
                                playSound("assets/sounds/MoveToSideClip.mp3");
                                widget.curPlanet--;
                                movePlane();
                              } else {
                                bool contentOpen = false;
                                //If a content container was open when clicked, open the next moon's content
                                GlobalKey<PlanetState>? curKey =
                                    planetKeys[widget.curPlanet];
                                if (curKey.currentState?.openBools[curPoint] ==
                                    true) {
                                  contentOpen = true;
                                  //Close content
                                  toggleContentPoint();
                                }
                                if (curKey.currentState!.point > 0) {
                                  curPoint--;
                                  //Tell Planet to change its current selected Moon
                                  selectPoint();
                                } else {
                                  curPoint = curKey.currentState!
                                          .containerWidgets.length -
                                      1;
                                  selectPoint();
                                  if (contentOpen) {
                                    toggleContentPoint();
                                  }
                                }

                                if (contentOpen) {
                                  toggleContentPoint();
                                }
                              }
                              updateScanner();
                            },
                            onRightArrowTap: () {
                              playSound("button");
                              if (!atPlanet) {
                                playSound("assets/sounds/MoveToSideClip.mp3");
                                widget.curPlanet++;
                                movePlane();
                              } else {
                                bool contentOpen = false;
                                //If a content container was open when clicked, open the next moon's content
                                GlobalKey<PlanetState>? curKey =
                                    planetKeys[widget.curPlanet];
                                if (curKey.currentState?.openBools[curPoint] ==
                                    true) {
                                  contentOpen = true;
                                  //Close content
                                  toggleContentPoint();
                                }

                                //Prevent user from going out of range
                                if (curKey.currentState!.point <
                                    curKey.currentState!.containerWidgets
                                            .length -
                                        1) {
                                  curPoint++;
                                  //Tell Planet to change its current selected Moon
                                  selectPoint();
                                } else {
                                  curPoint = 0;
                                  selectPoint();
                                  if (contentOpen) {
                                    toggleContentPoint();
                                  }
                                }

                                if (contentOpen) {
                                  toggleContentPoint();
                                }
                              }
                              updateScanner();
                            },
                            onUpArrowTap: () {
                              if (!atPlanet) {
                                curPoint = 0;
                                playSound("button");
                                atPlanet = true;
                                playSound(
                                    "assets/sounds/FutureToPlanetClip.mp3");
                                moveToPlanet();
                                updateScanner();
                              } else {
                                toggleContentPoint();
                              }
                            },
                            onDownArrowTap: () {
                              GlobalKey<PlanetState>? curKey =
                                  planetKeys[widget.curPlanet];
                              if (curKey.currentState?.openBools[curPoint] ==
                                  true) {
                                toggleContentPoint();
                              } else if (atPlanet) {
                                playSound("assets/sounds/button.mp3");
                                atPlanet = false;
                                moveBackFromPlanet();
                                updateScanner();
                                curPoint = 0;
                              }
                            },
                            onButton1Tap: () {
                              playSound("button");
                              selectPoint();
                              fireBool?.value = true;
                              playSound("NewLaserClip.mp3");
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                fireBool?.value = false;
                              });
                              updateScanner();
                            },
                            onButton2Tap: () {
                              playSound("button");
                              if (!atPlanet) {
                                atPlanet = true;
                                moveToPlanet();
                                updateScanner();
                              } else {
                                toggleContentPoint();
                              }
                            },
                            onHomeButtonTap: () {
                              playSound("button");
                              atPlanet = false;
                              moveBackFromPlanet();
                              updateScanner();
                            },
                          ),
                        ),
                      ),
                      //LOADING SCREEN
                      loading
                          ? Container(
                              // Use a semi-transparent black color for the background
                              color: Colors.black.withOpacity(0.85),
                              // Use a column to align the widgets vertically
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Display the progress as a number
                                  Text(
                                    "Toby Prosser's Portfolio",
                                    style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  // Display the progress as a loading bar
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: LinearProgressIndicator(
                                      value: progress / 10,
                                      color: Colors.blue,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Coded in dart using the flutter framework. All art assets created in Rive.",
                                    style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  );
                },
              ),
            ),
          )
        : const SizedBox();
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

  // A method to handle the key events
  void _handleKeyEvent(KeyEvent event) {
    // Get the key code of the event
    final int keyCode = event.logicalKey.keyId;
    // Check if the key code is in the map
    if (_keyMap.containsKey(keyCode)) {
      // Get the direction of the key code
      final String direction = _keyMap[keyCode]!;

      // Check if the event is a key down event
      if (event is KeyDownEvent) {
        // Check if the direction is not already in the list
        if (!_pressedDirections.contains(direction)) {
          // Add the direction to the list
          setState(() {
            _pressedDirections.add(direction);
            if (direction == 'Up') {
              if (!atPlanet) {
                playSound("button");
                atPlanet = true;
                playSound("sounds/FutureToPlanetClip.mp3");
                moveToPlanet();
                updateScanner();
              } else {
                toggleContentPoint();
              }
            } else if (direction == 'Left') {
              print("Left");
              playSound("button");
              if (!atPlanet) {
                playSound("sounds/MoveToSideClip.mp3");
                widget.curPlanet--;
                movePlane();
              } else {
                bool contentOpen = false;
                //If a content container was open when clicked, open the next moon's content
                GlobalKey<PlanetState>? curKey = planetKeys[widget.curPlanet];
                if (curKey.currentState?.openBools[curPoint] == true) {
                  contentOpen = true;
                  //Close content
                  toggleContentPoint();
                }
                //Prevent user from going out of range
                if (curKey.currentState!.point > 0) {
                  curPoint--;
                  //Tell Planet to change its current selected Moon
                  selectPoint();
                } else {
                  curPoint = curKey.currentState!.containerWidgets.length - 1;
                  selectPoint();
                  if (contentOpen) {
                    toggleContentPoint();
                  }
                }

                if (contentOpen) {
                  toggleContentPoint();
                }
              }
              updateScanner();
            } else if (direction == 'Down') {
              GlobalKey<PlanetState>? curKey = planetKeys[widget.curPlanet];
              if (curKey.currentState?.openBools[curPoint] == true) {
                toggleContentPoint();
              } else if (atPlanet) {
                playSound("button");
                atPlanet = false;
                moveBackFromPlanet();
                updateScanner();
                curPoint = 0;
              }
            } else if (direction == 'Right') {
              print("Right");
              playSound("button");
              if (!atPlanet) {
                widget.curPlanet++;
                movePlane();
                playSound("sounds/MoveToSideClip.mp3");
              } else {
                bool contentOpen = false;
                //If a content container was open when clicked, open the next moon's content
                GlobalKey<PlanetState>? curKey = planetKeys[widget.curPlanet];
                if (curKey.currentState?.openBools[curPoint] == true) {
                  contentOpen = true;
                  //Close content
                  toggleContentPoint();
                }

                //Prevent user from going out of range
                if (curKey.currentState!.point <
                    curKey.currentState!.containerWidgets.length - 1) {
                  curPoint++;
                  //Tell Planet to change its current selected Moon
                  selectPoint();
                } else {
                  curPoint = 0;
                  selectPoint();
                  if (contentOpen) {
                    toggleContentPoint();
                  }
                }

                if (contentOpen) {
                  toggleContentPoint();
                }
              }
              updateScanner();
            } else if (direction == 'Space' || direction == '1') {
              playSound("button");
              selectPoint();
              fireBool?.value = true;
              playSound("sounds/NewLaserClip.mp3");
              Future.delayed(const Duration(milliseconds: 500), () {
                fireBool?.value = false;
              });
              updateScanner();
            } else if (direction == 'Enter' || direction == '2') {
              playSound("button");
              if (!atPlanet) {
                atPlanet = true;
                moveToPlanet();
                updateScanner();
              } else {
                toggleContentPoint();
              }
            } else if (direction == 'Esc') {
              playSound("button");
              atPlanet = false;
              moveBackFromPlanet();
              updateScanner();
            }
          });
        }
      }

      // Check if the event is a key up event
      if (event is KeyUpEvent) {
        // Check if the direction is in the list
        if (_pressedDirections.contains(direction)) {
          // Remove the direction from the list
          setState(() {
            _pressedDirections.remove(direction);
          });
        }
      }
    }
  }
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter; // getter for counter

  void increment() {
    // increment counter and notify listeners
    _counter++;
    notifyListeners();
  }
}
