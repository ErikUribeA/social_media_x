import 'package:flutter/material.dart';
import 'package:social_media_x/models/post_model.dart';
import 'package:social_media_x/widgets/common/dart_card.dart';

class PostList extends StatelessWidget {
  const PostList({
    super.key,
    required this.posts,
    required this.isLoading,
    required this.onScroll,
  });

  final List<Post> posts;
  final bool isLoading;
  final ScrollController onScroll;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: onScroll,
      itemCount: posts.length + 1, // +1 para el indicador de carga
      itemBuilder: (context, index) {
        if (index == posts.length) {
          return isLoading
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                )
              : const SizedBox.shrink();
        }
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
