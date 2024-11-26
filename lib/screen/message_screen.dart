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
      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to your inbox!',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 15),
            const Text(
              'Drop a line, share post and more with private conversations between you and others on X.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerStart,
                child: (ElevatedButton(
                    onPressed: () {
                      ('Button Pressed!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Color de fondo del botón
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Relleno del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Bordes redondeados
                      ),
                    ),
                    child: const Text(
                      'Write a message',
                      style: TextStyle(color: Colors.black),
                    ))))
          ],
        ),
      )),
    );
  }
}
