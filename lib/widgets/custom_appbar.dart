import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/custom_tabbar.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final int currentIndex;
  final User currentUser;
  final Function(int) onTap;

  const CustomAppBar(
      {super.key,
      required this.icons,
      required this.currentIndex,
      required this.currentUser,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ), // BoxDecoration
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              icons: icons,
              currentIndex: currentIndex,
              onTap: onTap,
              isBottomIndicator:true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(
                  width: 12.0,
                ),
                CircleButton(
                  size: 30,
                  icon: Icons.search,
                  onPreesed: () => print('search'),
                ),
                CircleButton(
                  size: 30,
                  icon: MdiIcons.facebookMessenger,
                  onPreesed: () => print('search'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
