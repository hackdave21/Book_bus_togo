//import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/data/datasources/transport_company_data.dart';
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/ticket_screens/widgets/ticket_card.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primaryColor,
        actions: const [
          HeroIcon(
            HeroIcons.funnel,
            color: AppTheme.white,
          )
        ],
        title: Text("Tickets",
            style: AppTheme().stylish2(18, AppTheme.white, isBold: true)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: AppTheme().stylish2(15, Colors.grey, isBold: true),
                hintText: "Rechercher un ticket...",
                prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: transportCompanies.length,
                itemBuilder: (context, index) {
                  return TicketCard(transportCompany: transportCompanies[index]);
                },
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
