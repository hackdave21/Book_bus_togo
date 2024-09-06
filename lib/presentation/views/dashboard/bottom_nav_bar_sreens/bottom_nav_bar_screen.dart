import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/home_screens/home_screen.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/profile_screens/profile_screen.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/ticket_screen.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      backgroundColor: AppTheme.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(),
        children: const  [
          HomeScreen(),
          TicketScreen(),
          ProfileScreen(),
        ], 
      ),
      bottomNavigationBar: Container(
        color: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: AppTheme.primaryColor,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppTheme.white,
          color: AppTheme.white,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.confirmation_number,
              text: 'Ticket',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped, 
        ),
      ),
    );
  }
}
