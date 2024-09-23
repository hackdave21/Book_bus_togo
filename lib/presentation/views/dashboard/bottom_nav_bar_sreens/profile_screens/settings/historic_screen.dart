import 'package:book_bus_togo/data/datasources/ticket_cart.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:book_bus_togo/domain/entities/transport_company.dart';

class TicketHistoryScreen extends StatelessWidget {
  const TicketHistoryScreen({super.key});

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
          child: const Icon(Icons.arrow_back_ios, color: AppTheme.white,),
        ),
        title: Text(
          'Historique des Tickets',
          style: AppTheme().stylish2(18, AppTheme.white, isBold: true),
        ),
        actions: const [
          HeroIcon(
            HeroIcons.calendar,
            color: AppTheme.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tickets Réservés',
              style: AppTheme().stylish2(16, AppTheme.primaryColor, isBold: true),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: reservedTickets.length,
                itemBuilder: (context, index) {
                  return _buildTicketCard(
                    reservedTickets[index]['company'],
                    reservedTickets[index]['reservationDate'],
                    isUsed: false,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tickets Utilisés',
              style: AppTheme().stylish2(16, AppTheme.primaryColor, isBold: true),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: usedTickets.length,
                itemBuilder: (context, index) {
                  return _buildTicketCard(
                    usedTickets[index]['company'],
                    usedTickets[index]['reservationDate'],
                    isUsed: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard(TransportCompany company, DateTime reservationDate, {bool isUsed = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: CircleAvatar(
            backgroundImage: AssetImage(company.logoPath),
          ),
          title: Text(company.name, style: AppTheme().stylish2(16, Colors.black)),
          subtitle: Text(
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
