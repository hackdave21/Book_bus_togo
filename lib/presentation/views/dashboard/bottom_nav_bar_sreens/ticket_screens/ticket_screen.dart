import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primaryColor,
        actions: const [
          HeroIcon(HeroIcons.funnel, color: AppTheme.white,)
        ],
       title: Text("Tickets", style: AppTheme().stylish2(18, AppTheme.white, isBold: true)),
      ),
      body: const Column(),
    );
  }
}