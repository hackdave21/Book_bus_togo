import 'package:flutter/material.dart';
import 'package:book_bus_togo/themes/app_themes.dart';
import 'package:book_bus_togo/core/utils/screen_size.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key, required this.onFormValid});
  final ValueChanged<bool> onFormValid;

  @override
  // ignore: library_private_types_in_public_api
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>(); 
  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, 
      onChanged: () => _validateForm(),
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
                    style: AppTheme()
                        .stylish1(17, AppTheme.primaryColor, isBold: true),
                  ),
                ),
                SizedBox(height: context.heightPercent(1)),
                _buildLabel("Nom"),
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
                _buildLabel("Prénom"),
                _buildTextField(
                  controller: _firstNameController,
                  hintext: 'Ex. John',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Le prénom est obligatoire';
                    }
                    return null;
                  },
                ),
                _buildLabel("Numéro de téléphone"),
                _buildTextField(
                  controller: _phoneController,
                  hintext: 'Ex. 90 90 90 90',
                  keyboardType: TextInputType.phone,
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

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        label,
        style: AppTheme().stylish1(15, AppTheme.black, isBold: true),
      ),
    );
  }

  Widget _buildTextField({
    required String hintext,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
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
        validator: validator, 
      ),
    );
  }

  void _validateForm() {
    widget.onFormValid(_formKey.currentState?.validate() ?? false);
  }
}
