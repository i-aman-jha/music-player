import 'dart:typed_data';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Uint8List? artwork;
  final VoidCallback onTap;
  final VoidCallback? onLongPressed;
  final Widget? trailing;

  const MyListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.artwork,
    required this.onTap,
    this.onLongPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        leading: artwork != null
            ? Image.memory(
                artwork!,
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              )
            : Container(
                height: 50,
                width: 50,
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white
                    : Colors.black,
                child: const Icon(
                  Icons.music_note,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: trailing,
        onTap: onTap,
        onLongPress: onLongPressed,
      ),
    );
  }
}
