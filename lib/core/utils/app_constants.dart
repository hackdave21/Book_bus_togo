import'package:flutter/material.dart';

import '../../themes/app_themes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final IconData? icon;
  final double textSize;
  final Color buttonTextColor;
  final bool isTextBold;
  final String? imagePath;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppTheme.primaryColor,
    this.borderRadius = 30.0,
    this.icon,
    this.textSize = 16.0,
    this.buttonTextColor = AppTheme.white,
    this.isTextBold = false,
    this.imagePath, required Color textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null)
              Image.asset(imagePath!, height: 24, width: 24),
            if (imagePath != null)
              const SizedBox(width: 8),
            if (icon != null)
              Icon(icon, color: buttonTextColor),
            if (icon != null)
              const SizedBox(width: 8),
            Text(
              text,
              style: AppTheme().stylish1(textSize, buttonTextColor, isBold: isTextBold),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLength;
  final String errorMessage;

   const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.maxLength,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: _validateInput(controller.text) ? null : errorMessage,
          border: const OutlineInputBorder(),
          counterText: '',
        ),
      ),
    );
  }

  bool _validateInput(String input) {
    return input.isNotEmpty;
  }
}