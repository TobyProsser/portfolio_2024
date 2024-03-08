import 'package:flutter/material.dart';

import 'screens/homescreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<HomeScreenState> hsKey = GlobalKey<HomeScreenState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeScreen,
    );
  }
}
