import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:book_bus_togo/themes/app_themes.dart';

class NavigationButtons extends StatelessWidget {
  final bool showNext;
  final bool showPrev;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  const NavigationButtons({
    super.key,
    this.showNext = false,
    this.showPrev = false,
    required this.onNext,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showPrev)
          Container(
             width: context.widthPercent(30),
        height: context.heightPercent(7),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
            child: InkWell(
              onTap: onPrev,
              child:  Center(child: Text('Précédent',  style:  AppTheme().stylish1(15, AppTheme.white, isBold: true))),
            ),
          ),
        if (showNext)
          Container(
              width: context.widthPercent(30),
        height: context.heightPercent(7),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
            child: InkWell(
              onTap: onNext,
              child:  Center(child: Text('Suivant', style: AppTheme().stylish1(15, AppTheme.white, isBold: true),)),
            ),
          ),
      ],
    );
  }
}
