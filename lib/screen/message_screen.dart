import 'package:flutter/material.dart';
import 'package:social_media_x/widgets/common/floating_button.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
        onPressed: () {
          ('Floating Action Button Pressed!');
        },
        icon: Icons.email,
      ),
      body: const Center(
        child: Text('Messages Screen'),
      ),
    );
  }
}
