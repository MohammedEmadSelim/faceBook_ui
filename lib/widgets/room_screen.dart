import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class Room extends StatelessWidget {
  final List<User> onlineUsers;
  const Room({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: onlineUsers.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(imageUrl: user.imageUrl, isAcrive: true),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print('create room');
      },
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.blueAccent[100] ?? Colors.amber,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        textStyle: const MaterialStatePropertyAll(
          TextStyle(
            color: Palette.facebookBlue,
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text(
            'Create\nRoom',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Palette.facebookBlue),
          ),
        ],
      ),
    );
  }
}
