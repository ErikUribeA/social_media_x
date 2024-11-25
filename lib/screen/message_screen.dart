import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(), // Mantener la forma circular
        child: const Icon(Icons.mark_email_read, color: Colors.white),
        onPressed: () {
          // Aquí puedes definir la acción del botón flotante
          
        },
      ),
      body: const Center(
        child: Text('Messages Screen'),
      ),
    );
  }
}
