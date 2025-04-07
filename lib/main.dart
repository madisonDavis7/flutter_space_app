//navigation

import 'package:flutter/material.dart';
import 'components/home.dart';
import 'components/mercury.dart';
import 'components/venus.dart';
import 'components/earth.dart';
import 'components/mars.dart';
import 'components/jupiter.dart';
import 'components/saturn.dart';
import 'components/uranus.dart';
import 'components/neptune.dart';
import 'components/navigation.dart';
import 'components/map.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase (causes issues)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black26),
      ),

      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/navigation': (context) => NavigationPage(),
        '/mercury': (context) => MercuryPage(),
        '/venus': (context) => VenusPage(),
        '/earth': (context) => EarthPage(),
        '/mars': (context) => MarsPage(),
        '/jupiter': (context) => JupiterPage(),
        '/saturn': (context) => SaturnPage(),
        '/uranus': (context) => UranusPage(),
        '/neptune': (context) => NeptunePage(),
        '/map': (context) => MapPage(),

        // Add more routes here as needed
      },
    );
  }
}

//👻