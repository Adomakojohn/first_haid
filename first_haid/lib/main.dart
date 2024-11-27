// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/routes_generator.dart';
import 'features/chat/domain/model/cached_messages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  await dotenv.load(fileName: ".env");

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await Hive.openBox<CachedMessages>('messages');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY']!);
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
      //home: SetupProfilePage(),
      initialRoute: hasSeenOnboarding!
          ? AppRoutes.authrepository
          : AppRoutes.onboardingmainpage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
