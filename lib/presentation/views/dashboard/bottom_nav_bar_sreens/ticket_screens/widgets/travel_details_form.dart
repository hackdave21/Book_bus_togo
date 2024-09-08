import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class TravelDetailsForm extends StatefulWidget {
  const TravelDetailsForm({super.key});

  @override
  State<TravelDetailsForm> createState() => _TravelDetailsFormState();
}

class _TravelDetailsFormState extends State<TravelDetailsForm> {
   String? selectedOption; 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Donnez les détails de votre voyage", style:  AppTheme().stylish1(17, AppTheme.primaryColor, isBold: true)),
          ),
            SizedBox(height: context.heightPercent(1),),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Jour de départ", style:  AppTheme().stylish1(15, AppTheme.black, isBold: true)),
          ),
          _buildDropdownField(hintext: 'Lundi', items: ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi','Samedi', 'Dimanche']),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Heure de départ", style:  AppTheme().stylish1(15, AppTheme.black, isBold: true)),
          ),
          _buildDropdownField(hintext: '6h', items: ['6h', '8h', '12h']),
           Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Padding(
              padding:  EdgeInsets.only(left: 8),
              child:  Text(
                'Bagages supplémentaires ?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            Row(
              children: [
                Radio<String>(
                  value: 'Oui',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                const Text('Oui'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Non',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                const Text('Non'),
              ],
            ),
            
          ],
        ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({required String hintext, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hintext,
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
