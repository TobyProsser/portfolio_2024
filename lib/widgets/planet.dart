import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_2024/screens/homescreen.dart';
import 'package:rive/rive.dart';
import 'contentpoint.dart';
import 'flagwidget.dart';

// ignore: must_be_immutable
class Planet extends StatefulWidget {
  Planet({
    GlobalKey<PlanetState>? key,
    required this.selected,
    required this.curPoint,
    required this.screenWidth,
    required this.screenHeight,
    required this.planetLookNum,
    required this.contentClasses,
    required this.onPlanetClick,
    required this.atThisPlanet,
    required this.homeScreenKey,
    required this.mobile,
  }) : super(key: key);

  late bool selected;
  late bool atThisPlanet;
  final bool mobile;
  late int curPoint;
  double screenWidth;
  double screenHeight;
  int planetLookNum;

  final GlobalKey<HomeScreenState> homeScreenKey;

  final List<Widget> contentClasses;
  late List<ContainerWidget> containerWidgets;

  final VoidCallback? onPlanetClick;

  @override
  State<Planet> createState() => PlanetState();

  Planet copyWith({
    GlobalKey<PlanetState>? key,
    GlobalKey<HomeScreenState>? homeScreenKey,
    bool? selected,
    bool? atThisPlanet,
    bool? mobile,
    int? curPoint,
    double? screenWidth,
    double? screenHeight,
    int? planetLookNum,
    List<Widget>? contentClasses,
    VoidCallback? onPlanetClick,
    // Add any other properties you need for the Planet class
  }) {
    return Planet(
      key: key ?? this.key as GlobalKey<PlanetState>?,
      selected: selected ?? this.selected,
      curPoint: curPoint ?? this.curPoint,
      screenHeight: screenHeight ?? this.screenHeight,
      screenWidth: screenWidth ?? this.screenWidth,
      planetLookNum: planetLookNum ?? this.planetLookNum,
      contentClasses: contentClasses ?? this.contentClasses,
      onPlanetClick: onPlanetClick ?? this.onPlanetClick,
      atThisPlanet: atThisPlanet ?? this.atThisPlanet,
      homeScreenKey: homeScreenKey ?? this.homeScreenKey,
      mobile: mobile ?? this.mobile,
    );
  }
}

class PlanetState extends State<Planet> with SingleTickerProviderStateMixin {
  final String riveFileName = 'assets/portfoliocontrol.riv';
  late List<Artboard> artBoards = [];

  late bool complete = false;
  late int point = 0;

  late AnimationController containerAnimController;

  late Animation<double> _widthAnimation;
  // An animation for the container's height
  late Animation<double> _heightAnimation;

  late StateMachineController _flagController;

  Future<void> _loadRiveFile() async {
    List<String> artboardNames = [
      'Planet',
      'Planet1',
      'Planet2',
      'Planet3',
      'Flag',
      'BSIFlag',
      'AboutFlag',
      'GalleryFlag',
      'FathomFlag',
    ];

    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile.import(bytes);
    for (int i = 0; i < artboardNames.length; i++) {
      Artboard? artboard = file.artboardByName(artboardNames[i]);
      setState(() {
        artBoards.add(artboard!);
      });
    }
    _flagController = StateMachineController.fromArtboard(
      artBoards[getFlagArtboardNum()],
      'FlagMachine',
    )!;
    artBoards[getFlagArtboardNum()].addController(_flagController);
    complete = true;
  }

  String flagText = '';

  @override
  void initState() {
    containerAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // Initialize the width animation from 50 to 300 pixels
    Tween<double> tween =
        Tween<double>(begin: 30, end: (widget.screenWidth * 2) * .33);
    // Initialize the height animation from 50 to 200 pixels
    Tween<double> tween1 =
        Tween<double>(begin: 30, end: (widget.screenHeight * 2) * .33);

    _widthAnimation = tween.animate(
      CurvedAnimation(
        parent: containerAnimController,
        curve: Curves.easeOut,
      ),
    );
    _heightAnimation = tween1.animate(
      CurvedAnimation(
        parent: containerAnimController,
        curve: Curves.easeOut,
      ),
    );
    _loadRiveFile();

    super.initState();
    print("PLANET INIT");
  }

  @override
  void dispose() {
    containerAnimController.dispose();
    _flagController.dispose();
    super.dispose();
  }

  List<bool> openBools = [false, false, false, false];

  List<GlobalKey<ContainerWidgetState>> keys =
      List.generate(4, (index) => GlobalKey<ContainerWidgetState>());

  late List<ContainerWidget> containerWidgets = [
    ContainerWidget(
      content: Container(),
      title: "Null",
      hsKey: widget.homeScreenKey,
      index: 0,
      mobile: false,
    ),
    ContainerWidget(
      content: Container(),
      title: "Null",
      hsKey: widget.homeScreenKey,
      index: 1,
      mobile: false,
    ),
    ContainerWidget(
      content: Container(),
      title: "Null",
      hsKey: widget.homeScreenKey,
      index: 2,
      mobile: false,
    )
  ];
  late List<ContainerWidget> ogContainerWidgets;

  void updateSelectedBool({required double planesX, required double planetsX}) {
    setState(() {
      widget.selected = planesX == planetsX;
    });
  }

  int getArtboardNum() {
    int number = 0;
    if (widget.planetLookNum == 0) {
      number = 0;
    } else if (widget.planetLookNum == 1) {
      number = 1;
    } else if (widget.planetLookNum == 2) {
      number = 2;
    } else {
      number = 3;
    }
    return number;
  }

  int getFlagArtboardNum() {
    int number = 0;
    if (widget.planetLookNum == 0) {
      number = 4;
    } else if (widget.planetLookNum == 1) {
      number = 5;
    } else if (widget.planetLookNum == 2) {
      number = 7;
    } else {
      number = 8;
    }
    return number;
  }

  List<String> getTitle() {
    List<String> titles = [''];
    if (widget.planetLookNum == 0) {
      titles = ['Unity Engine', 'Unreal Engine'];
    } else if (widget.planetLookNum == 1) {
      titles = ['About BSI', 'Dev Process'];
    } else if (widget.planetLookNum == 2) {
      titles = ['This Portfolio', 'Gallery', 'About Me'];
    } else {
      titles = ['Hanger18', 'Hanger18 Dev', 'UI Design'];
    }
    return titles;
  }

  // ignore: unused_element
  void _selectContainer(int index) {
    setState(() {
      point = index;
    });
  }

  void animateFlags() {
    for (int i = 0; i < keys.length; i++) {
      GlobalKey<ContainerWidgetState>? curKey = keys[i];
      GlobalKey<FlagWidgetState>? flagKey = curKey.currentState?.flagKey;
      flagKey?.currentState?.animate();
    }
  }

  GlobalKey<FlagWidgetState> flagKey = GlobalKey<FlagWidgetState>();

  double findFlagHeight() {
    double number = 0;
    if (widget.planetLookNum == 0) {
      number = 110;
    } else if (widget.planetLookNum == 1) {
      number = 60;
    } else if (widget.planetLookNum == 2) {
      number = 90;
    } else {
      number = 80;
    }

    if (widget.screenWidth > 1100) {
      number += 100;
    }
    return number;
  }

  double findFlagSize() {
    double size = 0;
    if (widget.screenWidth < 500) {
      size = 350;
    } else {
      size = 350;
    }
    return size;
  }

  String findFlagText() {
    String flagText = '';
    if (widget.planetLookNum == 0) {
      flagText = 'Game Dev';
    } else if (widget.planetLookNum == 1) {
      flagText = 'BlackSwan Intel';
    } else if (widget.planetLookNum == 2) {
      flagText = 'About';
    } else {
      flagText = 'Fathom C.';
    }
    return flagText;
  }

  double findFlagLength() {
    double num = 0;
    if (widget.planetLookNum == 0) {
      num = 110;
    } else if (widget.planetLookNum == 1) {
      num = 165;
    } else if (widget.planetLookNum == 2) {
      num = 75;
    } else {
      num = 80;
    }
    return num;
  }

  double findTopStart(int index) {
    double num = 0;
    if (widget.mobile) {
      if (index < 2) {
        num = 50 + (index * widget.screenHeight * .25);
      } else {
        num = 50 + 1.75 * widget.screenHeight * .25;
      }
    } else {
      if (index < 2) {
        num = 100 + (index * widget.screenHeight * .25);
      } else {
        num = 50 + 1.75 * widget.screenHeight * .25;
      }
    }
    return num;
  }

  double findLeftSide(int index, double width) {
    double num = 0;
    if (width <= 500) {
      if (index != 2) {
        num = 50 + (index * 50);
      } else {
        num = 75;
      }
    } else {
      if (index != 2) {
        num = 50 + (index * widget.screenWidth * .33);
      } else {
        num = 50 + (.75 * widget.screenWidth * .33);
      }
    }
    return num;
  }

  void findStackOrder() {
    ContainerWidget openContainer = getContainer();
    if (openBools.contains(true)) {
      //shuffle stack until the first element is the open container
      for (int i = 0; i < 10; i++) {
        containerWidgets.shuffle();
        if (containerWidgets.first == openContainer) {
          return;
        }
      }
    }
  }

  //Find the container that is open
  ContainerWidget getContainer() {
    ContainerWidget temp = containerWidgets.first;
    for (var element in containerWidgets) {
      if (element.open == true) {
        temp = element;
      }
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return complete
        ? Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              widget.selected
                  ? OverflowBox(
                      child: Container(
                        width: 320,
                        height: 320,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: openBools[0]
                              ? const Color.fromARGB(255, 216, 179, 176)
                              : const Color.fromARGB(255, 175, 250, 255),
                        ),
                      ),
                    )
                  : Container(),
              GestureDetector(
                onTap: () {
                  //widget.onPlanetClick?.call();
                },
                child: Rive(
                  artboard: artBoards[getArtboardNum()],
                  alignment: Alignment.center,
                  useArtboardSize: true,
                ),
              ),
              complete
                  ? Stack(
                      children: containerWidgets =
                          List.generate(widget.contentClasses.length, (index) {
                        ContainerWidget tempContainer = ContainerWidget(
                          content: Container(),
                          title: "title",
                          hsKey: widget.homeScreenKey,
                          index: index,
                          mobile: widget.mobile,
                        );

                        // create a Positioned widget for each item in the list
                        tempContainer = tempContainer.copyWith(
                            // update the container widget with the given parameters
                            globalKey: keys[index],
                            selected: point == index,
                            someContentIsOpen: openBools.contains(true) &&
                                openBools[index] != true,
                            screenWidth: widget.screenWidth,
                            screenHeight: widget.screenHeight,
                            heightAnimation: _heightAnimation.value,
                            widthAnimation: _widthAnimation.value,
                            content: widget.contentClasses[index],
                            topStart: findTopStart(index),
                            leftStart: findLeftSide(index, width),
                            open: openBools[index],
                            atThisPlanet: widget.atThisPlanet,
                            title: getTitle()[index],
                            hsKey: widget.homeScreenKey,
                            index: index);
                        return tempContainer;
                      }),
                    )
                  : Container(
                      color: Colors.green,
                    ),
              //FLAG
              widget.atThisPlanet
                  ? Container()
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          25,
                          0,
                          0,
                          findFlagHeight(),
                        ),
                        child: FractionallySizedBox(
                          widthFactor: width < 1100 ? .8 : .45,
                          heightFactor: 1,
                          child: Rive(
                            artboard: artBoards[getFlagArtboardNum()],
                            alignment: Alignment.center,
                            useArtboardSize: false,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
            ],
          )
        : Container(
            color: Colors.blue,
          );
  }
}
