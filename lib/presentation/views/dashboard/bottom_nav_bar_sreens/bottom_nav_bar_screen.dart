import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/home_screens/home_screen.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/profile_screens/profile_screen.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/ticket_screen.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          HomeScreen(),
          TicketScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: AppTheme().stylish1(16, AppTheme.primaryColor, isBold: true),
        unselectedLabelStyle: AppTheme().stylish1(15, AppTheme.black),
        backgroundColor: AppTheme.white,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.black.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases_sharp),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
