import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Payez maintenant", style:  AppTheme().stylish1(17, AppTheme.primaryColor, isBold: true)),
            SizedBox(height: context.heightPercent(5),),
            _buildTextField(label: 'Numéro de carte'),
            _buildTextField(label: 'Date d\'expiration'),
            _buildTextField(label: 'CVV'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
