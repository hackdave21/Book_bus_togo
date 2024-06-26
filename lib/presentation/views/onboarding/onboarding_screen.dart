
import 'package:flutter/material.dart';

import '../../../themes/app_themes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/bus.png', color: AppTheme.secondaryColor,),
            Row(children: [
              Text(
                "BookBusTogo",
                style: AppTheme().stylish1(25, AppTheme.secondaryColor, isBold: true),
              ),
            ],),
            Center(
              child: Text(
                "Bienvenue",
                style: AppTheme().stylish2(15, AppTheme.secondaryColor, isBold: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
