import 'package:flutter/material.dart';
import 'package:music/configs/theme/theme_colors.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const MyIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      // Adjust elevation as needed
      shadowColor: (Theme.of(context).brightness == Brightness.dark)
          ? ThemeColors.buttonShadowDark
          : null,
      color: (Theme.of(context).brightness == Brightness.dark)
          ? Colors.black
          : Colors.white,
      shape: const CircleBorder(),
      // Use CircleBorder for a circular shape
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        // Match the shape of the Material widget
        child: Padding(
          padding: const EdgeInsets.all(16), // Adjust padding as needed
          child: Icon(icon),
        ),
      ),
    );
  }
}
