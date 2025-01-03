import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
    this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        side: borderColor != null ? BorderSide(color: borderColor!) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
      ),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
