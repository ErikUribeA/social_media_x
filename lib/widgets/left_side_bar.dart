import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeftSideBar extends StatelessWidget {
  final int currentIndex; // Índice del elemento seleccionado
  final ValueChanged<int> onIndexChanged; // Función para manejar cambios de selección

  const LeftSideBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  // Lista de elementos del menú (sin etiquetas)
  final List<IconData> _menuIcons = const [
    Icons.home,
    Icons.search,
    Icons.data_usage,
    Icons.people,
    Icons.notifications,
    Icons.email,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Ancho de la barra lateral
      color: Colors.black,
      child: Column(
        children: [
          // Ícono de Twitter en la parte superior, alineado a la derecha
          const Padding(
            padding: EdgeInsets.only(top: 20.0), // Espacio superior
            child: Align(
              alignment: Alignment.centerRight, // Alineado a la derecha
              child: FaIcon(
                FontAwesomeIcons.xTwitter,
                size: 40, // Ajusta el tamaño si es necesario
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20), // Espacio entre el ícono de Twitter y los íconos del menú

          // El resto de los íconos del menú
          ..._menuIcons.asMap().entries.map((entry) {
            final int index = entry.key;
            final IconData icon = entry.value;

            return MouseRegion(
              onEnter: (_) {
                // Acciones cuando el cursor entra
              },
              onExit: (_) {
                // Acciones cuando el cursor sale
              },
              cursor: SystemMouseCursors.click, // Cambiar el cursor a un puntero
              child: GestureDetector(
                onTap: () {
                  onIndexChanged(index); // Actualiza el índice seleccionado
                },
                child: Container(
                  color: Colors.transparent, // No hay color de fondo para el elemento activo
                  child: ListTile(
                    hoverColor: Colors.transparent, // Desactiva el hover
                    contentPadding: const EdgeInsets.all(5.0),
                    trailing: Icon(
                      icon,
                      color: currentIndex == index ? Colors.white : Colors.grey,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
