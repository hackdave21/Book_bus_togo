import 'dart:async';
import 'package:book_bus_togo/core/utils/app_helpers.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/bottom_nav_bar_screen.dart';
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
  bool showWelcomeText = true;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBarScreen()),
        );
      });
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        showWelcomeText = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Image.asset(
                    'assets/bus.png',
                    color: AppTheme.primaryColor,
                    width: 100,
                    height: 100,
                  ),
                  AppHelpers.getSpacerWidth(1),
                  Text(
                    "BookBusTogo",
                    style: AppTheme()
                        .stylish1(29, AppTheme.primaryColor, isBold: true),
                  ),
                ],
              ),
            ),
            Center(
              child: showWelcomeText
                  ? Text(
                      "Bienvenue",
                      style: AppTheme().stylish2(15, AppTheme.primaryColor,
                          isBold: true),
                    )
                  : const CircularProgressIndicator( color: AppTheme.primaryColor,), 
            ),
          ],
        ),
      ),
    );
  }
}
