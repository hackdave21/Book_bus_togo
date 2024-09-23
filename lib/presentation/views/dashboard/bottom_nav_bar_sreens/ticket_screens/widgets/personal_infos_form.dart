import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text("Veuillez remplir tous les champs", style:  AppTheme().stylish1(17, AppTheme.primaryColor, isBold: true)),
              ),
              SizedBox(height: context.heightPercent(1),),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text("Nom", style:  AppTheme().stylish1(15, AppTheme.black, isBold: true)),
              ),
              _buildTextField(hintext: 'Ex. ABALO'),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text("Prénom", style:  AppTheme().stylish1(15, AppTheme.black, isBold: true)),
              ),
              _buildTextField(hintext: 'Ex. John'),
               Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text("Numéro de téléphone", style:  AppTheme().stylish1(15, AppTheme.black, isBold: true)),
              ),
              _buildTextField(hintext: 'Ex. 90 90 90 90'),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintext}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText:  hintext,
              hintStyle: AppTheme().stylish1(15, Colors.grey, isBold: true),
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppTheme.white
            ),
          ),
        ],
      ),
    );
  }


}
