// lib/main.dart
import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'routes/routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'First Haid App',
      initialRoute: AppRoutes.signuppage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
