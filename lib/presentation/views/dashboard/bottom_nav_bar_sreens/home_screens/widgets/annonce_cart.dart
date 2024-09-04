import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:book_bus_togo/themes/app_themes.dart';

class AnnonceCard extends StatelessWidget {
  final String description;

  const AnnonceCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  "400 x 200",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTheme().stylish2(16, Colors.black, isBold: false),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
              onTap: () {},
               child: Container(
                width: double.infinity,
                height: context.heightPercent(6),
                decoration:  BoxDecoration(color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(15)),
                child: Center(child: Row (children: [
                  const HeroIcon(HeroIcons.handThumbUp, color: AppTheme.white,),
                  Text('J\'aime',  style: AppTheme().stylish2(15, AppTheme.white, isBold: true))
                ],)),
               ),
             ),
                const SizedBox(width: 16),
                InkWell(
              onTap: () {},
               child: Container(
                width: double.infinity,
                height: context.heightPercent(6),
                decoration:  BoxDecoration(color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(15)),
                child: Center(child: Row (children: [
                  const HeroIcon(HeroIcons.handThumbUp, color: AppTheme.white,),
                  Text('Je n\'aime pas',  style: AppTheme().stylish2(15, AppTheme.white, isBold: true))
                ],)),
               ),
             ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
