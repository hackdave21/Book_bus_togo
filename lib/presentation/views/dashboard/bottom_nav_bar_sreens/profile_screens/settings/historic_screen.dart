import 'package:book_bus_togo/domain/entities/transport_company.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:book_bus_togo/core/utils/screen_size.dart';

// Ticket model with reservation status and date
class Ticket {
  final TransportCompany company;
  final DateTime reservationDate;
  final bool isUsed;

  Ticket({
    required this.company,
    required this.reservationDate,
    required this.isUsed,
  });
}

class HistoricScreen extends StatelessWidget {
  final List<Ticket> reservedTickets = [
    Ticket(
      company: TransportCompany(logoPath: 'assets/images/company1.png', name: 'Nagode Transfert'),
      reservationDate: DateTime(2023, 9, 5),
      isUsed: false,
    ),
    Ticket(
      company: TransportCompany(logoPath: 'assets/images/company2.png', name: 'Togo Express'),
      reservationDate: DateTime(2023, 8, 25),
      isUsed: false,
    ),
  ];

  final List<Ticket> usedTickets = [
    Ticket(
      company: TransportCompany(logoPath: 'assets/images/company3.png', name: 'Kempinski Transport'),
      reservationDate: DateTime(2023, 7, 18),
      isUsed: true,
    ),
  ];

  HistoricScreen({super.key});

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historique des Tickets',
          style: AppTheme().stylish2(18, AppTheme.white, isBold: true),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tickets réservés',
                style: AppTheme().stylish1(18, AppTheme.black, isBold: true),
              ),
              SizedBox(height: context.heightPercent(1)),
              ...reservedTickets.map((ticket) => TicketCard(ticket: ticket)).toList(),
              SizedBox(height: context.heightPercent(3)),
              Text(
                'Tickets utilisés',
                style: AppTheme().stylish1(18, AppTheme.black, isBold: true),
              ),
              SizedBox(height: context.heightPercent(1)),
              ...usedTickets.map((ticket) => TicketCard(ticket: ticket)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({super.key, required this.ticket});

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: ticket.isUsed ? Colors.grey.shade300 : Colors.white,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(ticket.company.logoPath),
                    radius: 30,
                  ),
                  SizedBox(width: context.widthPercent(4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.company.name,
                        style: AppTheme().stylish1(16, AppTheme.black),
                      ),
                      SizedBox(height: context.heightPercent(1)),
                      Text(
                        'Date de réservation: ${formatDate(ticket.reservationDate)}',
                        style: AppTheme().stylish1(14, AppTheme.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
