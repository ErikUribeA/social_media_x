class Post {
  final String avatarUrl;
  final String name;
  final String username;
  final String timeAgo;
  final String content;
  final String? imageUrl;
  final int comments;
  final int retweets;
  final int likes;
  final int views;

  Post({
    required this.avatarUrl,
    required this.name,
    required this.username,
    required this.timeAgo,
    required this.content,
    this.imageUrl,
    required this.comments,
    required this.retweets,
    required this.likes,
    required this.views,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      avatarUrl: json['avatartUrl'] ?? '', // Nota: estaba mal escrito en el JSON
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'],
      comments: json['comments'] ?? 0,
      retweets: json['retweets'] ?? 0,
      likes: json['likes'] ?? 0,
      views: json['views'] ?? 0,
    );
  }
}
