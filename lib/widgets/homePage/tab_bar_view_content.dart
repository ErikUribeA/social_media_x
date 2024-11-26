import 'package:flutter/material.dart';
import 'package:social_media_x/widgets/homePage/post_list.dart';
import 'package:social_media_x/widgets/homePage/following_cards.dart';
import 'package:social_media_x/models/post_model.dart';

class TabBarViewContent extends StatelessWidget {
  const TabBarViewContent({
    super.key,
    required this.forYouPosts,
    required this.followingPosts,
    required this.isLoading,
    required this.onScroll,
  });

  final List<Post> forYouPosts; 
  final List<Post> followingPosts; 
  final bool isLoading;
  final ScrollController onScroll;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        // Pestaña "For You"
        PostList(
          posts: forYouPosts,
          isLoading: isLoading,
          onScroll: onScroll,
        ),

        // Pestaña "Following"
        FollowingCards(
          posts: followingPosts, // Pasa los posts para "Following"
          
        ),
      ],
    );
  }
}
