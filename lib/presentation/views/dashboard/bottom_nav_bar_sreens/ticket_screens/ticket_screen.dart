import 'package:book_bus_togo/data/datasources/transport_company_data.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/widgets/ticket_card.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primaryColor,
        title: Text("Tickets",
            style: AppTheme().stylish2(18, AppTheme.white, isBold: true)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.white,
                hintStyle: AppTheme().stylish2(15, Colors.grey, isBold: true),
                hintText: "Rechercher un ticket...",
                prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6, 
                  crossAxisSpacing: 6, 
                  childAspectRatio: 0.7, 
                ),
                itemCount: transportCompanies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TicketCard(transportCompany: transportCompanies[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
