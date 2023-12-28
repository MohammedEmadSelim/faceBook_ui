import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/screens/screens.dart';
import 'package:facebook_ui/widgets/widgets.dart';
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

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  // final List<BottomNavigationBarItem> _icons = [
  //   const BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.home,
  //       ),
  //       label: ''),
  //   const BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: ''),
  //   BottomNavigationBarItem(
  //       icon: Icon(MdiIcons.accountCircleOutline), label: ''),
  //   BottomNavigationBarItem(
  //       icon: Icon(MdiIcons.accountGroupOutline), label: ''),
  //   BottomNavigationBarItem(icon: Icon(MdiIcons.bellOutline), label: ''),
  //   const BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
  // ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final appBarWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Resposive.isDesktop(context)

        // incredible PreferredSize widget gives typically use case height and width to child
            ? PreferredSize(
              
                preferredSize: Size(appBarWidth, 100.0),
                child: CustomAppBar(
                  icons: _icons,
                  currentUser: currentUser,
                  currentIndex: _currentIndex,
                  onTap: (index) => setState(
                    () => _currentIndex = index,
                  ),
                ),
              )
            : null,
        // indexdstack has very powerful advantage (save the position in scrolling and return you at the same position if you moved to an aother screen and getted back)
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: !Resposive.isDesktop(context)
            ? CustomTabBar(
                icons: _icons,
                currentIndex: _currentIndex,
                onTap: (index) => setState(
                  () => _currentIndex = index,
                ),
              )
            // BottomNavigationBar(
            //     showSelectedLabels: false,
            //     showUnselectedLabels: false,
            //     elevation: 10,
            //     iconSize: 29,
            //     type: BottomNavigationBarType.fixed,
            //     currentIndex: _currentIndex,
            //     items: _icons,
            //     unselectedItemColor: Colors.grey[600],
            //     selectedItemColor: Palette.facebookBlue,
            //     onTap: (index) => setState(
            //       () {
            //         _currentIndex = index;
            //       },
            //     ),
            //   )
            : const SizedBox.shrink(),
      ),
    );
  }
}
