import 'package:flutter/material.dart';
import 'package:social_media_x/models/post_model.dart';
import 'package:social_media_x/widgets/common/dart_card.dart';

class FollowingCards extends StatelessWidget {
  const FollowingCards({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return TwitterPostCard(
          avatarUrl: post.avatarUrl,
          name: post.name,
          username: post.username,
          timeAgo: post.timeAgo,
          content: post.content,
          imageUrl: post.imageUrl,
          comments: post.comments,
          retweets: post.retweets,
          likes: post.likes,
          views: post.views,
        );
      },
    );
  }
}
