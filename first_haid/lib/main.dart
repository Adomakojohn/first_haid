// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:first_haid/features/home/pages/bottom_nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/routes/routes_generator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Haid App',
      home: BottomNavBarPage(),
      //initialRoute: AppRoutes.onboardingmainpage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
