import 'package:flutter/material.dart';
import 'ejercicio1/ejercicio1.dart'; // Pantalla Ejercicio 1
import 'ejercicio2/ejercicio2.dart'; // Pantalla Ejercicio 2
import 'ejercicio3/ejercicio3.dart'; // Pantalla Ejercicio 3
import 'ejercicio4/ejercicio4.dart'; // Pantalla Ejercicio 4
import 'ejercicio5/ejercicio5.dart'; // Pantalla Ejercicio 5

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF81C784), Color(0xFF4CAF50), Color(0xFFA5D6A7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.menu_book_rounded,
                size: 120,
                color: Color(0xFFFF7043), // Naranja suave
              ),
              const SizedBox(height: 20),
              const Text(
                'Menú Principal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Comic Sans MS',
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black26,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50), // Espaciado entre texto y botones
              _buildMenuButton(
                context,
                label: 'Ejercicio 1: Tabla caracteres ASCII',
                color: const Color(0xFF80DEEA), // Azul claro
                icon: Icons.font_download_rounded,
                page: Ejercicio1Page(),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                label: 'Ejercicio 2: Factorial de un número',
                color: const Color(0xFFFFC107), // Amarillo suave
                icon: Icons.calculate_rounded,
                page: Ejercicio2Page(),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                label: 'Ejercicio 3: MCD de dos números',
                color: const Color(0xFF81C784), // Verde suave
                icon: Icons.settings_applications_rounded,
                page: Ejercicio3Page(),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                label: 'Ejercicio 4: Factorización de un número',
                color: const Color(0xFFB39DDB),  // Lavanda suave
                icon: Icons.precision_manufacturing,  // Nuevo ícono
                page: Ejercicio4Page(),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                label: 'Ejercicio 5: Números primos entre 3 y 32767',
                color: const Color(0xFF90CAF9),  // Azul suave
                icon: Icons.calculate_rounded,
                page: Ejercicio5Page(),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Regresar a la pantalla anterior
                },
                icon: const Icon(Icons.arrow_back_rounded, size: 24),
                label: const Text(
                  'Volver',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: const Color(0xFF8E24AA), // Morado suave
                  foregroundColor: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context,
      {required String label,
        required Color color,
        required IconData icon,
        required Widget page}) {
    return GestureDetector(
      onTap: () {
        // Animación de transición
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Movimiento hacia la derecha
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: Colors.black),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
