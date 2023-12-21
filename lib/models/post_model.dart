import 'package:facebook_ui/models/user_model.dart';
import 'package:meta/meta.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  String? imageUrl=null;
  final int likes;
  final int comments;
  final int shares;

   Post( {
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    required this.shares,
    this.imageUrl,


  });
}
