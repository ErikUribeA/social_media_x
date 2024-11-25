import 'package:flutter/material.dart';

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({
    super.key,
    required this.tabs, // Lista de pestañas
  });

  final List<Tab> tabs; // Recibe las pestañas

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.blue,
      tabs: tabs, // Usa las pestañas recibidas
    );
  }
}
