import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), 
            ),
          ],
          color: Colors.white, 
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                width: double.infinity,
                height: context.heightPercent(13),
                decoration:  BoxDecoration(color: AppTheme.inContainerColor, borderRadius: BorderRadius.circular(15)),
                child: const Center(child: Text("200 x 100")),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Détails du ticket de transport : Bus 101 - Départ à 09:00 AM",
               style: AppTheme().stylish1(15, AppTheme.black),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
           Padding(
             padding: const EdgeInsets.all(7),
             child: InkWell(
              onTap: () {},
               child: Container(
                width: double.infinity,
                height: context.heightPercent(6),
                decoration:  BoxDecoration(color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text('Reserver',  style: AppTheme().stylish2(15, AppTheme.white, isBold: true))),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
