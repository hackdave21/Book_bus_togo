import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {

  int _selectedPaymentMethod = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedPaymentMethod = value!;
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choisissez votre methode de paiement et suivez les instructions", style:  AppTheme().stylish1(17, AppTheme.primaryColor, isBold: true)),
            SizedBox(height: context.heightPercent(5),),
            RadioListTile(
                  title: Row(
                    children: [
                      Image.asset('assets/tmoney.png', width: 100, height: 100),
                      SizedBox(width: context.widthPercent(5)),
                      Text('TMONEY',
                          style: AppTheme().stylish1(15, AppTheme.black, isBold: true))
                    ],
                  ),
                  value: 2,
                  groupValue: _selectedPaymentMethod,
                  onChanged: _handleRadioValueChange,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                Container(
                    height: context.heightPercent(0.2), color: const Color.fromARGB(255, 206, 205, 205)),
                RadioListTile(
                  title: Row(
                    children: [
                      Image.asset('assets/flooz.png', width: 100, height: 100),
                     SizedBox(width: context.widthPercent(5)),
                      Text('FLOOZ',
                          style: AppTheme().stylish1(15, AppTheme.black, isBold: true))
                    ],
                  ),
                  value: 3,
                  groupValue: _selectedPaymentMethod,
                  onChanged: _handleRadioValueChange,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
          ],
        ),
      ),
    );
  }

}
