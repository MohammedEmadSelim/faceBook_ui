import 'package:facebook_ui/screens/screens.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CreatPostContainer extends StatelessWidget {
  final User currentUser;
  const CreatPostContainer({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Resposive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: isDesktop ? BorderRadius.circular(10) : null,
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                  isAcrive: false,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?'),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              height: 10.0,
              thickness: 0.5,
            ),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    label: const Text(
                      'Live',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    onPressed: () => print('flatButton'),
                  ),
                  const VerticalDivider(
                    width: 8,
                    color: Colors.white,
                  ),
                  FlatButton(
                    label: const Text(
                      'Photo',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    onPressed: () => print('photo'),
                  ),
                  const VerticalDivider(
                    width: 8,
                    color: Colors.white,
                  ),
                  FlatButton(
                    label: const Text(
                      'Room',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.purpleAccent,
                    ),
                    onPressed: () => print('room'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

mixin white {}

class FlatButton extends StatelessWidget {
  final Icon icon;
  final Text label;
  final Function() onPressed;
  bool onHover = false;

  FlatButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: label,
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(Colors.grey[200]),
      ),
    );
  }
}
