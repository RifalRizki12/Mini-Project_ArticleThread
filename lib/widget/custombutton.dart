import 'package:flutter/material.dart';
import 'package:mini_project/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.label,
    required this.onPressed,
    this.text,
    this.minimumsize,
    this.style,
    this.bColor,
  });
  final String? text;
  final Size? minimumsize;

  final TextStyle? style;
  final Color? bColor;

  final String? label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label ?? "",
        style: style ?? Styles.buttonDefaultTextStyle,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: bColor ?? Styles.buttonDefaultBackgroundColor,
          elevation: 0,
          minimumSize: minimumsize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onPressed: onPressed,
    );
  }
}
