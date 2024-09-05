import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'Les plus récentes'; // Variable pour le filtre sélectionné

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
                            icon: const HeroIcon(HeroIcons.xMark, size: 25, color: AppTheme.white,),
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
                        borderRadius: BorderRadius.circular(15)
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
          "Nouveau", 
          style: AppTheme().stylish2(18, AppTheme.white, isBold: true),
        ),
      ),
      body: Padding(
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
                child: Container(
                  width: double.infinity,
                  height: context.heightPercent(13),
                  decoration: BoxDecoration(
                    color: AppTheme.inContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("200 x 100")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Détails du ticket de transport : Bus 101 - Départ à 09:00 AM",
                  style: AppTheme().stylish1(15, AppTheme.black),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(7),
                child: InkWell(
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
                        style: AppTheme().stylish2(15, AppTheme.white, isBold: true),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
