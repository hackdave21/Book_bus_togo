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
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Donnez les détails de votre voyage",
              style:
                  AppTheme().stylish1(15, AppTheme.primaryColor, isBold: true),
            ),
            SizedBox(height: context.heightPercent(1)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Agence de départ",
                        style: AppTheme()
                            .stylish1(15, AppTheme.black, isBold: true),
                      ),
                      _buildDropdownField(
                          hintext: 'Ville 1', items: ['Ville 1', 'Ville 2']),
                    ],
                  ),
                ),
                SizedBox(width: context.widthPercent(2)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Agence d'arrivée",
                        style: AppTheme()
                            .stylish1(15, AppTheme.black, isBold: true),
                      ),
                      _buildDropdownField(
                          hintext: 'Ville 1', items: ['Ville 1', 'Ville 2']),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: context.heightPercent(1)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nombre de tickets",
                  style: AppTheme().stylish1(15, AppTheme.black, isBold: true),
                ),
                _buildDropdownField(
                  hintext: '1',
                  items: ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
                ),
              ],
            ),
            SizedBox(height: context.heightPercent(2)),
            Container(
              height: context.heightPercent(7),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Prix total à payer: ",
                      style: AppTheme()
                          .stylish1(15, AppTheme.primaryColor, isBold: true),
                    ),
                    Text(
                      "7 000 XOF",
                      style: AppTheme()
                          .stylish1(15, AppTheme.primaryColor, isBold: true),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.heightPercent(1)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jour de départ",
                        style: AppTheme()
                            .stylish1(15, AppTheme.black, isBold: true),
                      ),
                      _buildDropdownField(
                        hintext: 'Lundi',
                        items: [
                          'Lundi',
                          'Mardi',
                          'Mercredi',
                          'Jeudi',
                          'Vendredi',
                          'Samedi',
                          'Dimanche'
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.widthPercent(2)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Heure de départ",
                        style: AppTheme()
                            .stylish1(15, AppTheme.black, isBold: true),
                      ),
                      _buildDropdownField(
                        hintext: '6h',
                        items: ['6h', '8h', '12h'],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: context.heightPercent(1)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bagages supplémentaires ?',
                  style: AppTheme().stylish1(15, AppTheme.black, isBold: true),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10.0,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          activeColor: AppTheme.primaryColor,
                          value: 'Oui',
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                        Text('Oui',
                            style: AppTheme()
                                .stylish2(12, AppTheme.black, isBold: true)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          activeColor: AppTheme.primaryColor,
                          value: 'Non',
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                        Text('Non',
                            style: AppTheme()
                                .stylish2(12, AppTheme.black, isBold: true)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(
      {required String hintext, required List<String> items}) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppTheme.white,
      decoration: InputDecoration(
        hintText: hintext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppTheme.white,
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style:
                  AppTheme().stylish1(15, AppTheme.primaryColor, isBold: true)),
        );
      }).toList(),
      onChanged: (newValue) {},
    );
  }
}
