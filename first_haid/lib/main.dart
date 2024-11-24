// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/routes_generator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    hasSeenOnboarding: hasSeenOnboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool? hasSeenOnboarding;
  const MyApp({super.key, this.hasSeenOnboarding});
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Haid App',
      // home: BottomNavBarPage(),
      initialRoute: hasSeenOnboarding!
          ? AppRoutes.authrepository
          : AppRoutes.onboardingmainpage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
