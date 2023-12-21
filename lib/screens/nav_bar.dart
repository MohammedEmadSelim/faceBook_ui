import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<Widget> screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<BottomNavigationBarItem> _icons = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: ''),
    BottomNavigationBarItem(
        icon: Icon(MdiIcons.accountCircleOutline), label: ''),
    BottomNavigationBarItem(
        icon: Icon(MdiIcons.accountGroupOutline), label: ''),
    BottomNavigationBarItem(icon: Icon(MdiIcons.bellOutline), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        iconSize: 29,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _icons,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Palette.facebookBlue,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
