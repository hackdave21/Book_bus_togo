import'package:flutter/material.dart';

import '../views/onboarding/onboarding_screen.dart';

class Routes {
  static const String home = '/';
  // static const String login = '/Loginscreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Pas de routes défini ${settings.name}'),
            ),
          ),
        );
    }
  }
}