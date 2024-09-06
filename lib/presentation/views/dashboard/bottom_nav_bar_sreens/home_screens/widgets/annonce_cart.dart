import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/domain/entities/annonce.dart';
import 'package:book_bus_togo/presentation/views/dashboard/shimmers/shimmers_loading.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../../themes/app_themes.dart';

class AnnonceCart extends StatefulWidget {

  final Annonce annonce;
  const  AnnonceCart({super.key, required this.annonce});

  @override
  State<AnnonceCart> createState() => _AnnonceCartState();
}

class _AnnonceCartState extends State<AnnonceCart> {
  bool isLoading = true; 
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: double.infinity,
        height: context.heightPercent(45),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading
                  ? ShimmerWidget(
                      width: double.infinity,
                      height: context.heightPercent(22),
                      borderRadius: BorderRadius.circular(15),
                    )
                  : Container(
                      height: context.heightPercent(25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppTheme.inContainerColor),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(widget.annonce.imagePath, fit: BoxFit.fill)),
                    ),
              SizedBox(height: context.heightPercent(0.5)),

              isLoading
                  ? ShimmerWidget(
                      width: context.widthPercent(80),
                      height: context.heightPercent(3),
                    )
                  : Text(
                      widget.annonce.description,
                      style: AppTheme().stylish2(14, AppTheme.black),
                    ),

              SizedBox(height: context.heightPercent(3)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isLoading
                      ? ShimmerWidget(
                          width: context.widthPercent(40),
                          height: context.heightPercent(6),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            width: context.widthPercent(40),
                            height: context.heightPercent(6),
                            decoration: BoxDecoration(
                                color: AppTheme.primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const HeroIcon(
                                    HeroIcons.handThumbUp,
                                    color: AppTheme.white,
                                  ),
                                   Container(
                                    height: context.heightPercent(2),
                                    width: context.widthPercent(0.3),
                                    color: AppTheme.white,
                                  ),
                                  Text(widget.annonce.likes.toString(),
                                      style: AppTheme().stylish2(
                                          15, AppTheme.white,
                                          isBold: true)),
                                ],
                              ),
                            ),
                          ),
                        ),
                  isLoading
                      ? ShimmerWidget(
                          width: context.widthPercent(40),
                          height: context.heightPercent(6),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            width: context.widthPercent(40),
                            height: context.heightPercent(6),
                            decoration: BoxDecoration(
                                color: AppTheme.primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const HeroIcon(
                                    HeroIcons.handThumbDown,
                                    color: AppTheme.white,
                                  ),
                                  Container(
                                    height: context.heightPercent(2),
                                    width: context.widthPercent(0.3),
                                    color: AppTheme.white,
                                  ),
                                  Text(widget.annonce.dislikes.toString(),
                                      style: AppTheme().stylish2(
                                          15, AppTheme.white,
                                          isBold: true)),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
