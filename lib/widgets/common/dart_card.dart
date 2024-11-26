import 'package:flutter/material.dart';

class TwitterPostCard extends StatelessWidget {
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

  const TwitterPostCard({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.username,
    required this.timeAgo,
    required this.content,
    this.imageUrl,
    this.comments = 0,
    this.retweets = 0,
    this.likes = 0,
    this.views = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                _buildImage(avatarUrl, isAvatar: true),
                const SizedBox(width: 12),
                // Name and username
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (name == "Sherry Wehner") // Ejemplo de verificación
                            const Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
                              ),
                            ),
                          const SizedBox(width: 4),
                          Text(
                            "@$username",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                // Menu button
                const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                content,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            // Image if exists
            if (imageUrl != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: _buildImage(imageUrl),
                ),
              ),
            // Interaction buttons
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInteractionButton(Icons.chat_bubble_outline, comments),
                  _buildInteractionButton(Icons.repeat, retweets),
                  _buildInteractionButton(Icons.favorite_border, likes),
                  _buildInteractionButton(Icons.bar_chart, views),
                  const Icon(Icons.share_outlined, color: Colors.grey, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String? url, {bool isAvatar = false}) {
    if (url == null) return const SizedBox.shrink();

    if (url.startsWith('http')) {
      return isAvatar
          ? CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 20,
            )
          : Image.network(
              url,
              width: double.infinity,
              fit: BoxFit.cover,
            );
    } else {
      return isAvatar
          ? CircleAvatar(
              backgroundImage: AssetImage(url),
              radius: 20,
            )
          : Image.asset(
              url,
              width: double.infinity,
              fit: BoxFit.cover,
            );
    }
  }

  Widget _buildInteractionButton(IconData icon, int count) {
    return InkWell(
      onTap: () {
        // Lógica para manejar el botón
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 4),
          Text(
            _formatCount(count),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}
