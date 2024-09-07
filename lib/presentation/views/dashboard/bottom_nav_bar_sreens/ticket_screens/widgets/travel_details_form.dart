import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class TravelDetailsForm extends StatelessWidget {
  const TravelDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Donnez les détails de votre voyage", style:  AppTheme().stylish1(17, AppTheme.primaryColor, isBold: true)),
            SizedBox(height: context.heightPercent(5),),
          _buildDropdownField(label: 'Agence de départ', items: ['Ville 1', 'Ville 2']),
          _buildDropdownField(label: 'Agence d\'arrivée', items: ['Ville 1', 'Ville 2']),
          _buildDropdownField(label: 'Jour de départ', items: ['Lundi', 'Mardi']),
          _buildDropdownField(label: 'Heure de départ', items: ['6h', '8h', '12h']),
        ],
      ),
    );
  }

  Widget _buildDropdownField({required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {},
      ),
    );
  }
}
