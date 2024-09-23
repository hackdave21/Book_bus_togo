import 'dart:async';
import 'package:book_bus_togo/core/utils/app_helpers.dart';
import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/bottom_nav_bar_screen.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  bool showWelcomeText = true;
  int count = 0;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    // Initialisation du contrôleur d'animation
    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..repeat(reverse: true);

    // Délai avant la navigation vers BottomNavBarScreen
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBarScreen()),
        );
      });
    });

    // Changer showWelcomeText après 3 secondes
    Timer(const Duration(seconds: 4), () {
      setState(() {
        showWelcomeText = false;
      });
    });

    // Ajout d'un listener pour gérer l'animation
    controller.addStatusListener((status) {
      if (status == AnimationStatus.reverse && count < 2) {
        Future.delayed(const Duration(milliseconds: 250), () {
          if (mounted) {
            setState(() {
              count++;
            });
          }
        });
      } else if (status != AnimationStatus.reverse && count == 2) {
        setState(() {
          count = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.removeStatusListener((status) {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
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
                : SizedBox(
                  height: context.heightPercent(10),
                  child: Flow(
                        delegate: FlowDotDelegate(animation: controller, count: count),
                        children: List.generate(
                          3,
                          (index) => Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ).toList(),
                              ),
                ), 
          ),
        ],
      ),
    );
  }
}

class FlowDotDelegate extends FlowDelegate {
  Animation<double> animation;
  int count;
  FlowDotDelegate({required this.animation, required this.count})
      : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    Animation<double> topPosition;
    double childWidth = context.getChildSize(0)!.width;
    int childCount = context.childCount;
    double spacing = 15 + childWidth;
    double width = context.size.width;
    double start = width / 2 - (childCount * spacing) / 2;
    for (int i = 0; i < context.childCount; ++i) {
      if (count == i) {
        topPosition = Tween<double>(begin: 10, end: 0).animate(animation);
      } else {
        topPosition = Tween<double>(begin: 10, end: 10).animate(animation);
      }
      context.paintChild(i,
          transform: Matrix4.translationValues(
              start + (i * spacing), topPosition.value, 0));
    }
  }

  @override
  bool shouldRepaint(FlowDotDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
