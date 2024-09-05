
import 'package:book_bus_togo/presentation/views/dashboard/bottom_nav_bar_sreens/home_screens/widgets/annonce_cart.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'Les plus récentes';

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filtrer les annonces',
                          style: AppTheme().stylish1(18, AppTheme.black, isBold: true),
                        ),
                        CircleAvatar(
                          backgroundColor: AppTheme.primaryColor,
                          child: IconButton(
                            icon: const HeroIcon(HeroIcons.xMark, size: 25, color: AppTheme.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: _selectedFilter,
                          borderRadius: BorderRadius.circular(15),
                          isExpanded: true,
                          items: [
                            'Les plus récentes',
                            'Les plus anciennes',
                            'Les plus populaires'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedFilter = newValue!;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primaryColor,
        actions: [
          IconButton(
            onPressed: _showFilterDialog,
            icon: const HeroIcon(HeroIcons.funnel, color: AppTheme.white),
          ),
        ],
        title: Text(
          "Annonces",
          style: AppTheme().stylish2(18, AppTheme.white, isBold: true),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const AnnonceCart();
        },
      ),
    );
  }
}
