import 'package:flutter/material.dart';
import 'package:social_media_x/screen/data_screen.dart';
import 'package:social_media_x/screen/home_screen.dart';
import 'package:social_media_x/screen/message_screen.dart';
import 'package:social_media_x/screen/notification_screen.dart';
import 'package:social_media_x/screen/people_screen.dart';
import 'package:social_media_x/screen/search_screen.dart';
import 'package:social_media_x/widgets/app_bar.dart';
import 'package:social_media_x/widgets/navigation_bar_mobile.dart';
import '../utils/responsive_layout.dart';
import '../widgets/left_side_bar.dart';
import '../widgets/right_side_bar.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0; // Índice de la pantalla actual

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const DataScreen(),
    const PeopleScreen(),
    const NotificationsScreen(),
    const MessagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // Vista móvil
      mobileBody: Scaffold(
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: currentPageIndex,
          onIndexChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        body: _screens[currentPageIndex],
      ),

      // Vista web
      webBody: Scaffold(
        body: Row(
          children: [
            // Barra lateral izquierda
            LeftSideBar(
              currentIndex: currentPageIndex,
              onIndexChanged: (int index) {
                setState(() {
                  currentPageIndex = index; // Cambia la pantalla actual
                });
              },
            ),
            // Contenido principal
            Expanded(
              child: _screens[currentPageIndex], // Pantalla seleccionada
            ),
            // Barra lateral derecha
            const RightSideBar(),
          ],
        ),
      ),
    );
  }
}
