import 'package:flutter/material.dart';
import 'package:social_media_x/screen/message_screen.dart';
import 'package:social_media_x/screen/notification_screen.dart';
import 'app_bar.dart';
import '../screen/home_screen.dart';
import '../screen/search_screen.dart';
import '../screen/data_screen.dart';
import '../screen/people_screen.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

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
    return Scaffold( 
      appBar: const CustomAppBar(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.data_usage),
            icon: Icon(Icons.data_usage_outlined),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.people),
            icon: Icon(Icons.people_outlined),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_outlined),
            label: "",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.email),
            icon: Icon(Icons.email_outlined),
            label: "",
          ),
        ],
      ),
      body: _screens[currentPageIndex],
    );
  }
}