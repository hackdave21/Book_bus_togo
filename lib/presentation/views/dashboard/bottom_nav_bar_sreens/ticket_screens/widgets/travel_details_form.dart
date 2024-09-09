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
            child: Text("Donnez les détails de votre voyage", style:  AppTheme().stylish1(13, AppTheme.primaryColor, isBold: true)),
          ),
            SizedBox(height: context.heightPercent(1)),
             Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Agence de départ", style:  AppTheme().stylish1(13, AppTheme.black, isBold: true)),
            ),
          _buildDropdownField(hintext: 'Ville 1', items: ['Ville 1', 'Ville 2']),
          SizedBox(height: context.heightPercent(0.5)),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Agence d'arrivée", style:  AppTheme().stylish1(13, AppTheme.black, isBold: true)),
          ),
          _buildDropdownField(hintext: 'Ville 1', items: ['Ville 1', 'Ville 2']),
           SizedBox(height: context.heightPercent(1)),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              height: context.heightPercent(7),
              decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
              child: Padding(
              padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Text("Prix : ", style:  AppTheme().stylish1(15, AppTheme.primaryColor, isBold: true)),
                    Text("7 000 XOF", style:  AppTheme().stylish1(15, AppTheme.primaryColor, isBold: true))
                  ],
                ),
              )),
          ),
           SizedBox(height: context.heightPercent(0.5)),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Jour de départ", style:  AppTheme().stylish1(13, AppTheme.black, isBold: true)),
          ),
          _buildDropdownField(hintext: 'Lundi', items: ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi','Samedi', 'Dimanche']),
           SizedBox(height: context.heightPercent(0.5)),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text("Heure de départ", style:  AppTheme().stylish1(13, AppTheme.black, isBold: true)),
          ),
          _buildDropdownField(hintext: '6h', items: ['6h', '8h', '12h']),
           SizedBox(height: context.heightPercent(0.5)),
           Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child:  Text(
                'Bagages supplémentaires ?',
                style: AppTheme().stylish1(13, AppTheme.black, isBold: true),
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
                 Text('Oui', style: AppTheme().stylish2(12, AppTheme.black, isBold: true)),
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
                 Text('Non', style: AppTheme().stylish2(12, AppTheme.black, isBold: true),),
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
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hintext,
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          filled: true,
          fillColor: AppTheme.white
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
