import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? actions;

  const TopBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leading != null)
              leading!
            else if (leading == null && actions != null)
              const SizedBox(width: 55),
            // const Expanded(child: SizedBox()), // Add leading if it's not null
            if (title != null) title!,
            // const Expanded(child: SizedBox()), // Add leading if it's not null
            if (actions != null)
              actions! // Add actions if it's not null
            else if (actions == null && leading != null)
              const SizedBox(width: 55),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
