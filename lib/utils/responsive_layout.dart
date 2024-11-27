import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody; // Vista móvil
  final Widget webBody;    // Vista web

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.webBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          // Pantalla móvil
          return mobileBody;
        } else {
          // Pantalla web
          return webBody;
        }
      },
    );
  }
}
