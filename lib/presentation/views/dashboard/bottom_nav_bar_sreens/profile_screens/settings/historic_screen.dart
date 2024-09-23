import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/core/utils/text_size.dart';
import 'package:book_bus_togo/data/datasources/historic_ticket_data.dart';
import 'package:book_bus_togo/presentation/views/dashboard/shimmers/shimmers_loading.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:book_bus_togo/domain/entities/transport_company.dart';

class TicketHistoryScreen extends StatefulWidget {
  const TicketHistoryScreen({super.key});

  @override
  _TicketHistoryScreenState createState() => _TicketHistoryScreenState();
}

class _TicketHistoryScreenState extends State<TicketHistoryScreen> {
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
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: AppTheme.white),
        ),
        title: Text(
          'Historique des Tickets',
          style: AppTheme().stylish2(18, AppTheme.white, isBold: true),
        ),
        actions: const [
          HeroIcon(
            HeroIcons.calendar,
            color: AppTheme.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Tickets Réservés
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tickets Réservés',
                style: AppTheme().stylish2(16, AppTheme.primaryColor, isBold: true),
              ),
            ),
            SizedBox(height: context.t1), // Garde ton `SizedBox` original
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reservedTickets.length,
              itemBuilder: (context, index) {
                return _buildTicketCard(
                  reservedTickets[index]['company'],
                  reservedTickets[index]['reservationDate'],
                  isUsed: false,
                  isLoading: isLoading,
                );
              },
            ),
            SizedBox(height: context.t1), // Garde ton `SizedBox` original
            Container(
              width: double.infinity,
              height: context.heightPercent(0.2),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: context.t1), // Garde ton `SizedBox` original

            // Section Tickets Utilisés
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tickets Utilisés',
                style: AppTheme().stylish2(16, AppTheme.primaryColor, isBold: true),
              ),
            ),
            SizedBox(height: context.t1), // Garde ton `SizedBox` original
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: usedTickets.length,
              itemBuilder: (context, index) {
                return _buildTicketCard(
                  usedTickets[index]['company'],
                  usedTickets[index]['reservationDate'],
                  isUsed: true,
                  isLoading: isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard(TransportCompany company, DateTime reservationDate, 
                          {bool isUsed = false, bool isLoading = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: isLoading
              ? const ShimmerWidget(width: 50, height: 50, borderRadius: BorderRadius.all(Radius.circular(50)))
              : CircleAvatar(
                  backgroundImage: AssetImage(company.logoPath),
                  radius: 25,
                ),
          title: isLoading
              ? const ShimmerWidget(width: 120, height: 20, borderRadius: BorderRadius.all(Radius.circular(8)))
              : Text(company.name, style: AppTheme().stylish2(16, Colors.black)),
          subtitle: isLoading
              ? const ShimmerWidget(width: 180, height: 16, borderRadius: BorderRadius.all(Radius.circular(8)))
              : Text(
                  'Réservé le: ${reservationDate.day}/${reservationDate.month}/${reservationDate.year}',
                  style: AppTheme().stylish2(14, Colors.grey),
                ),
          trailing: isUsed
              ? const Icon(Icons.check_circle, color: AppTheme.primaryColor)
              : const Icon(Icons.circle, color: Colors.green, size: 10),
        ),
      ),
    );
  }
}
