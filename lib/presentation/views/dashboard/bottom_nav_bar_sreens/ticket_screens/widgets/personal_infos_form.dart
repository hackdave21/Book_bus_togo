import 'package:book_bus_togo/core/utils/screen_size.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final GlobalKey<FormState> _personalInfoKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool validateForm() {
    // Forcer l'affichage des erreurs en appelant setState
    setState(() {});
    return _personalInfoKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personalInfoKey, // Clé de formulaire pour valider l'état
      child: Container(
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
                  child: Text(
                    "Veuillez remplir tous les champs",
                    style: AppTheme().stylish1(17, AppTheme.primaryColor, isBold: true),
                  ),
                ),
                SizedBox(height: context.heightPercent(1)),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Nom",
                    style: AppTheme().stylish1(15, AppTheme.black, isBold: true),
                  ),
                ),
                _buildTextField(
                  controller: _nameController,
                  hintext: 'Ex. ABALO',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le nom est obligatoire';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Prénom",
                    style: AppTheme().stylish1(15, AppTheme.black, isBold: true),
                  ),
                ),
                _buildTextField(
                  controller: _surnameController,
                  hintext: 'Ex. John',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le prénom est obligatoire';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Numéro de téléphone",
                    style: AppTheme().stylish1(15, AppTheme.black, isBold: true),
                  ),
                ),
                _buildTextField(
                  controller: _phoneController,
                  hintext: 'Ex. 90 90 90 90',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le numéro de téléphone est obligatoire';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintext,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: AppTheme().stylish1(15, Colors.grey, isBold: true),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppTheme.white,
        ),
        validator: validator,  // Validation de champ
        autovalidateMode: AutovalidateMode.onUserInteraction,  // Valider automatiquement à chaque interaction
      ),
    );
  }
}
