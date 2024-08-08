import 'package:flutter/material.dart';

class PlayerButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final bool play;

  const PlayerButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.size,
    required this.play,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
    return SizedBox(
      height: size,
      width: size,
      child: (play)
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: Icon(
                icon,
                size: size * .5,
                color: iconColor,
              ),
            )
          : IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: size * .5,
              )),
    );
  }
}
