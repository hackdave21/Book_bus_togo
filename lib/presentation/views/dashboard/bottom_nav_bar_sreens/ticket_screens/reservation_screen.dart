
import 'package:book_bus_togo/domain/entities/transport_company.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ReservationScreen extends StatefulWidget {
  final TransportCompany transportCompany;
  const ReservationScreen({super.key, required this.transportCompany});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const HeroIcon(HeroIcons.arrowLeft, color: AppTheme.white,),
        ),
        backgroundColor: AppTheme.primaryColor,
        title: Text(widget.transportCompany.name, style: AppTheme().stylish1(18, AppTheme.white, isBold: true), ),
      ),
      
    );
  }
}