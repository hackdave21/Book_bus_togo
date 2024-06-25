import 'package:book_bus_togo/presentation/routes/app_routes.dart';
import 'package:book_bus_togo/presentation/views/onboarding/onboarding_screen.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        title: 'BookBusTogo',
        theme: AppTheme.lightTheme,
        home: const OnboardingScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
      );
    
  }
}