import 'package:book_bus_togo/domain/entities/transport_company.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/reservation_screen.dart';
import 'package:book_bus_togo/presentation/views/dashboard/shimmers/shimmers_loading.dart';
import 'package:flutter/material.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:book_bus_togo/core/utils/screen_size.dart';

class TicketCard extends StatefulWidget {
  final TransportCompany transportCompany;
  const TicketCard({super.key, required this.transportCompany});

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
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
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
                        child: Image.asset(widget.transportCompany.logoPath, fit: BoxFit.fill)),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                 decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                child: Column(
                  children: [
                    Padding(
                padding: const EdgeInsets.all(8.0),
                child: isLoading
                    ? ShimmerWidget(
                        width: context.widthPercent(80),
                        height: context.heightPercent(3),
                      )
                    : Text(
                         widget.transportCompany.name,
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
                        onTap: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReservationScreen(transportCompany: widget.transportCompany,)),
                      );
                        },
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
            )
          ],
        ),
      ),
    );
  }
}
