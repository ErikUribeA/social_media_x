import 'package:flutter/material.dart';

class RightSideBar extends StatelessWidget {
  const RightSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: Colors.black,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white),
            title: const Text('Notifications', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.white),
            title: const Text('Messages', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          // Agrega más opciones aquí
        ],
      ),
    );
  }
}
