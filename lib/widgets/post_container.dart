import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/screens/screens.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Resposive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: isDesktop ? 5.0 : 0.0, vertical: 5.0),
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: isDesktop ? BorderRadius.circular(10) : null,
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PostHead(
                    post: post,
                  ),
                  Text('${post.caption}'),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 8.0,
                        )
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl!),
                  )
                : const SizedBox.shrink(),
            _PostStats(post: post),
            const Divider(
              color: Colors.white,
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _PostButton(
                  icon: MdiIcons.thumbUpOutline,
                  label: 'Like',
                  onPressed: () => print('Like'),
                  size: 20,
                ),
                _PostButton(
                  icon: MdiIcons.commentOutline,
                  label: 'Comment',
                  onPressed: () => print('comment'),
                  size: 20,
                ),
                _PostButton(
                  icon: MdiIcons.shareOutline,
                  label: 'Share',
                  onPressed: () => print('Share'),
                  size: 25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _PostHead extends StatelessWidget {
  const _PostHead({
    super.key,
    required this.post,
  });
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl, isAcrive: false),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('on pressed'),
          icon: const Icon(
            Icons.more_horiz,
          ),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Palette.facebookBlue, shape: BoxShape.circle),
                  child:
                      const Icon(color: Colors.white, Icons.thumb_up, size: 10),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  post.likes.toString(),
                ),
              ],
            ),
          ),
          Text(
            post.comments.toString() + ' Comments',
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            post.shares.toString() + ' Share',
          ),
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onPressed;
  final double size;
  const _PostButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: size, color: Colors.grey[600]),
                const SizedBox(
                  width: 4.0,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
