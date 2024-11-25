import 'package:flutter/material.dart';
import 'package:social_media_x/widgets/dart_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> posts = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadInitialPosts();
    _scrollController.addListener(_onScroll);
  }

  void _loadInitialPosts() {
    // Cargar los posts iniciales
    setState(() {
      posts = List.generate(10, (index) {
        return {
          'avatarUrl': index % 2 == 0 ? 'assets/images/ocean.jpeg' : 'assets/images/kenshi.jpeg',
          'name': 'User $index',
          'username': 'username_$index',
          'timeAgo': '${index}h',
          'content': 'Content of post $index',
          'imageUrl': index % 2 == 0 ? 'assets/images/ocean.jpeg' : 'assets/images/kenshi.jpeg',
          'comments': index * 5,
          'retweets': index * 10,
          'likes': index * 20,
          'views': index * 100,
        };
      });
    });
  }

  void _loadMorePosts() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    // Simular una carga asincrónica
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      posts.addAll(List.generate(10, (index) {
        return {
          'avatarUrl': (posts.length + index) % 2 == 0 ? 'assets/images/ocean.jpeg' : 'assets/images/kenshi.jpeg',
          'name': 'User ${posts.length + index}',
          'username': 'username_${posts.length + index}',
          'timeAgo': '${posts.length + index}h',
          'content': 'Content of post ${posts.length + index}',
          'imageUrl': (posts.length + index) % 2 == 0 ? 'assets/images/ocean.jpeg' : 'assets/images/kenshi.jpeg',
          'comments': (posts.length + index) * 5,
          'retweets': (posts.length + index) * 10,
          'likes': (posts.length + index) * 20,
          'views': (posts.length + index) * 100,
        };
      }));
      isLoading = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMorePosts();
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            // Acción del botón flotante
          },
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0, // Sin sombra
          title: const TabBar(
            labelColor: Colors.white, 
            unselectedLabelColor: Colors.white70, 
            indicatorColor: Colors.blue, 
            indicatorWeight: 3.0, 
            tabs: [
              Tab(
                text: 'For you',
              ),
              Tab(text: 'Following'),
            ],
          ),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: posts.length + 1, // +1 for the loading indicator
          itemBuilder: (context, index) {
            if (index == posts.length) {
              // Muestra un indicador de carga al final
              return isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink();
            }
            final post = posts[index];
            return TwitterPostCard(
              avatarUrl: post['avatarUrl'],
              name: post['name'],
              username: post['username'],
              timeAgo: post['timeAgo'],
              content: post['content'],
              imageUrl: post['imageUrl'],
              comments: post['comments'],
              retweets: post['retweets'],
              likes: post['likes'],
              views: post['views'],
            );
          },
        ),
      ),
    );
  }
}
