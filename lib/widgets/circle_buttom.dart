import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final Function() onPreesed;

  CircleButton({
    super.key,
    required this.size,
    required this.icon,
    required this.onPreesed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
        ),
        color: Colors.black,
        onPressed: onPreesed,
      ),
    );
  }
}
