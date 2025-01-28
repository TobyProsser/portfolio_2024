import 'package:flutter/material.dart';
import 'package:portfolio_2024/screens/initscreen.dart';

import 'screens/homescreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<HomeScreenState> hsKey = GlobalKey<HomeScreenState>();

void main() {
  print("First Line of code. Initialize widgets");
  WidgetsFlutterBinding.ensureInitialized();

  //webPluginRegistrar.registerMessageHandler();
  print("Before Run app, ensureItialized");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final HomeScreen homeScreen = HomeScreen(
    key: hsKey,
    hsKey: hsKey,
  );

  @override
  void initState() {
    print("initialization State");
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
    print("FireBase initailized");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This removes the debug banner

      initialRoute: '/',
      routes: {
        '/': (context) => const Initscreen(),
        '/home': (context) => homeScreen,
      },
      //showPerformanceOverlay: true,
    );
  }
}
