import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/domain/entities/transport_company.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/reservation_screen.dart';
import 'package:book_bus_togo/presentation/views/dashboard/shimmers/shimmers_loading.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReservationScreen(
                    transportCompany: widget.transportCompany)),
          );
        },
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: isLoading
                      ? ShimmerWidget(
                          width: double.infinity,
                          height: context.heightPercent(13), 
                          borderRadius: BorderRadius.circular(15),
                        )
                      : Container(                        
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(widget.transportCompany.logoPath,
                                fit: BoxFit.fill),
                          ),
                        ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(2),
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
                                  height: context.heightPercent(6),
                                )
                              : Text(
                                  widget.transportCompany.name,
                                  style:
                                      AppTheme().stylish1(15, AppTheme.black, isBold: true),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
