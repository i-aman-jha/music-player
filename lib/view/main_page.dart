import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'HomePage/Widgets/bottomplayer.dart';

class MainPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; // Track the currently selected screen

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: (Theme.of(context).brightness == Brightness.dark)
            ? Colors.black
            : Colors.grey.shade300,
        backgroundColor: Colors.transparent,
        height: 50,
        items: const [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.search,
            size: 30,
          ),
          Icon(
            Icons.library_music,
            size: 30,
          ),
        ],
        onTap: (index) {
          if (_currentIndex == index) {
            _goBranch(index);
          } else {
            setState(() {
              _currentIndex = index;
            });
            _goBranch(index);
          }
        },
      ),
      body: Stack(
        children: [
          widget.navigationShell,
          const BottomPlayer(),
        ],
      ),
    );
  }
}
