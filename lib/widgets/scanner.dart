import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

// ignore: must_be_immutable
class Scanner extends StatefulWidget {
  Scanner({
    super.key,
    this.width = 0,
    required this.mobile,
  });

  late double width;
  final bool mobile;

  Scanner copyWith({
    Key? key,
    double? width,
    bool? mobile,
  }) {
    return Scanner(
      key: key,
      width: width ?? this.width,
      mobile: mobile ?? this.mobile,
    );
  }

  @override
  State<Scanner> createState() => ScannerState();
}

class ScannerState extends State<Scanner> {
  final String riveFileName = 'assets/portfoliocontrol.riv';
  late List<Artboard> artBoards = [];
  late bool complete = false;

  String scannerText = "null";

  Future<void> _loadRiveFile() async {
    List<String> artboardNames = [
      'ControllerBackground',
      'ControllerDpad',
      'ControllerButton',
      'HomeButton',
      'Grills',
      'Plane',
      'Planet',
      'ControllerFull',
      'Scanner',
      'ScannerScreen'
    ];

    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile.import(bytes);
    for (int i = 0; i < artboardNames.length; i++) {
      Artboard? artBoard = file.artboardByName(artboardNames[i]);

      setState(() {
        artBoards.add(artBoard!);
      });
    }

    complete = true;
  }

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return complete
        ? SizedBox(
            width: 867.79 * .2,
            height: 302.09 * .2,
            child: widget.mobile
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Rive(
                          artboard: artBoards[8],
                          alignment: Alignment.center,
                          useArtboardSize: false,
                          fit: BoxFit.fill,
                        ),
                        widget.width >= 500
                            ? const Positioned(
                                top: 15,
                                left: 20,
                                child: Text(
                                  "You have Discovered:",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(17, 10, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "You have Discovered:",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      scannerText,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                        widget.width >= 500
                            ? Positioned(
                                top: 25,
                                left: 20,
                                child: Text(
                                  scannerText,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        Rive(
                          artboard: artBoards[9],
                          alignment: Alignment.center,
                          useArtboardSize: false,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  )
                : Stack(
                    children: [
                      Rive(
                        artboard: artBoards[8],
                        alignment: Alignment.center,
                        useArtboardSize: true,
                      ),
                      widget.width >= 500
                          ? const Positioned(
                              top: 15,
                              left: 20,
                              child: Text(
                                "You have Discovered:",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 7,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "You have Discovered:",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 7,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    scannerText,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                      widget.width >= 500
                          ? Positioned(
                              top: 25,
                              left: 20,
                              child: Text(
                                scannerText,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container(),
                      Rive(
                        artboard: artBoards[9],
                        alignment: Alignment.center,
                        useArtboardSize: true,
                      ),
                    ],
                  ),
          )
        : const SizedBox();
  }
}

/*
Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You have Discovered:",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 7,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        scannerText,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
*/

