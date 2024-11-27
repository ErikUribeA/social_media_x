import 'package:flutter/material.dart';
import 'package:social_media_x/models/post_model.dart';
import 'package:social_media_x/services/api_service.dart';
import 'package:social_media_x/widgets/common/floating_button.dart';
import 'package:social_media_x/widgets/common/tab_bar_header.dart';
import 'package:social_media_x/widgets/homePage/tab_bar_view_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();
  List<Post> forYouPosts = []; // Para "For You"
  List<Post> followingPosts = []; // Para "Following"
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    _loadInitialPosts();
    _loadFollowingPosts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        _loadMorePosts();
      }
    });
  }

  Future<void> _loadInitialPosts() async {
    setState(() => isLoading = true);
    try {
      final data = await _apiService.fetchPosts(page: 1, limit: 10);
      setState(() {
        forYouPosts = data.map((json) => Post.fromJson(json)).toList();
        page = 2;
      });
    } catch (e) {
      ('Error fetching posts: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _loadFollowingPosts() async {
    try {
      setState(() {
        followingPosts = List.generate(50, (index) {
          return Post(
            avatarUrl: index % 2 == 0 ? 'assets/images/ocean.jpeg' : 'assets/images/kenshi.jpeg',
            name: 'User $index',
            username: 'following_$index',
            timeAgo: '${index + 1}h',
            content: 'Content for Following Post $index',
            imageUrl: index % 2 == 0 ? 'assets/images/ocean.jpeg' : 'assets/images/kenshi.jpeg',
            comments: index * 2,
            retweets: index * 4,
            likes: index * 8,
            views: index * 16,
          );
        });
      });
    } catch (e) {
      ('Error loading following posts: $e');
    }
  }

  Future<void> _loadMorePosts() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    try {
      final data = await _apiService.fetchPosts(page: page, limit: 10);
      setState(() {
        forYouPosts.addAll(data.map((json) => Post.fromJson(json)).toList());
        page++;
      });
    } catch (e) {
      ('Error loading more posts: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const TabBarHeader(
            tabs: [
              Tab(text: 'For You'),
              Tab(text: 'Following'),
            ],
          ),
        ),
        floatingActionButton: FloatingButton(
          onPressed: () {
            ('Floating Action Button Pressed!');
          },
          icon: Icons.add,
        ),
        body: TabBarViewContent(
          forYouPosts: forYouPosts, // Pasa los posts de "For You"
          followingPosts: followingPosts, // Pasa los posts de "Following"
          isLoading: isLoading,
          onScroll: _scrollController,
        ),
      ),
    );
  }
}
