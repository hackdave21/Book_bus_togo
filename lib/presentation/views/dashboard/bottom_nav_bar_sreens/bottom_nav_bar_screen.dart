import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

import 'home_screens/home_screen.dart';
import 'profile_screens/profile_screen.dart';
import 'settings_screens/settings_screen.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = const [
    HomeScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.secondaryColor,
        title: Text(
          "BookBusTogo",
          style: AppTheme().stylish1(20, AppTheme.white, isBold: true),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu, color: AppTheme.white),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, color: AppTheme.white,))
        ],
      ),
      backgroundColor: AppTheme.primaryColor,
      extendBody: true,
      bottomNavigationBar: Container(
        height: 85,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              backgroundColor: AppTheme.secondaryColor,
              selectedItemColor: AppTheme.white,
              unselectedItemColor: AppTheme.grey,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Maison"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Paramètres"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: "Profil"),
              ]),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
