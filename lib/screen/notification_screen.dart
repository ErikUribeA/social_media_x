import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_media_x/widgets/common/floating_button.dart';
import 'package:social_media_x/widgets/common/tab_bar_header.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingButton(
          onPressed: () {
            ('Floating Action Button Pressed!');
          },
          icon: Icons.add,
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const TabBarHeader(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Verified'),
              Tab(text: 'Mentions'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Center(
              child: Text(
                'All page',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Nothing to see here -yet',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    // Usar RichText para estilizar el texto
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          const TextSpan(
                            text: 'Likes, mentions, repost, and a whole lot more — when it comes from a verified account, you will find it here. ',
                            style: TextStyle(
                              height: 1.5
                            )
                          ),
                          TextSpan(
                            text: 'Learn more',
                            style: const TextStyle(
                              color: Colors.blue, // Color para "Learn more"
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Acción para "Learn more"
                                ("Learn more tapped!");
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Not verified? Subscribe now to get a verified account and join other people in quality conversations.',
                      style: TextStyle(color: Colors.grey, 
                      height:  1.5),
                    ),
                    const SizedBox(height: 15),

                    // Aquí aplicamos el padding con porcentajes
                    ElevatedButton(
                      onPressed: () {
                        ('Button Pressed!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Color de fondo del botón
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.35, // 25% del ancho de la pantalla
                          vertical: screenHeight * 0.01, // 3% de la altura de la pantalla
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Bordes redondeados
                        ),
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'COP 52,900.00/month',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Join the conversation',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33, color: Colors.white),
                      ),
                    ),
                    Text(
                      'When someone on X mentions you in a post or reply, you will find it here',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
