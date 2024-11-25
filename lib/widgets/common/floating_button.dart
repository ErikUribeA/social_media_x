import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add, // Ícono por defecto
  });

  final VoidCallback onPressed;
  final IconData icon; // Nuevo parámetro para el ícono

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white), // Usa el ícono recibido
    );
  }
}
