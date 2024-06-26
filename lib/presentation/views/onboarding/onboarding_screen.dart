
import 'package:book_bus_togo/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../themes/app_themes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
 void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, '/Bottomnavbar'); 
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(children: [
                Image.asset('assets/bus.png', color: AppTheme.secondaryColor, width: 100, height: 100,),
                AppHelpers.getSpacerWidth(1),
                Text(
                  "BookBusTogo",
                  style: AppTheme().stylish1(35, AppTheme.secondaryColor, isBold: true),
                ),
              ],),
            ),
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
