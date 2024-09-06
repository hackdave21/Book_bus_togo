import 'package:book_bus_togo/presentation/views/dashboard/shimmers/shimmers_loading.dart';
import 'package:flutter/material.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:book_bus_togo/core/utils/screen_size.dart';

class TicketCard extends StatefulWidget {
  const TicketCard({super.key});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
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
              child: isLoading
                  ? ShimmerWidget(
                      width: double.infinity,
                      height: context.heightPercent(13),
                      borderRadius: BorderRadius.circular(15),
                    )
                  : Container(
                      width: double.infinity,
                      height: context.heightPercent(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/logonagode.jpg', fit: BoxFit.fill)),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? ShimmerWidget(
                      width: context.widthPercent(80),
                      height: context.heightPercent(3),
                    )
                  : Text(
                      "NAGODE TRANSFERT",
                      style: AppTheme().stylish1(15, AppTheme.black),
                      textAlign: TextAlign.center,
                    ),
            ),
            SizedBox(height: context.heightPercent(1),),
            Padding(
              padding: const EdgeInsets.all(7),
              child: isLoading
                  ? ShimmerWidget(
                      width: double.infinity,
                      height: context.heightPercent(6),
                      borderRadius: BorderRadius.circular(15),
                    )
                  : InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: context.heightPercent(6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Reserver',
                            style: AppTheme()
                                .stylish2(15, AppTheme.white, isBold: true),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
