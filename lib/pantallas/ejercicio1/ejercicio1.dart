import 'package:flutter/material.dart';
import '../../logica/logicaejer1.dart'; // Importa la lógica del ejercicio

class Ejercicio1Page extends StatefulWidget {
  const Ejercicio1Page({super.key});

  @override
  State<Ejercicio1Page> createState() => _Ejercicio1PageState();
}

class _Ejercicio1PageState extends State<Ejercicio1Page> {
  late List<String> tablaASCII; // Contiene los elementos generados
  int startIndex = 0; // Índice de inicio de la página actual
  final int itemsPerPage = 46; // Mostrará 46 caracteres por página (2 columnas)

  @override
  void initState() {
    super.initState();
    tablaASCII = generarTablaASCII(); // Generar la tabla ASCII
  }

  @override
  Widget build(BuildContext context) {
    // Obtener los elementos de la página actual
    List<String> currentItems = tablaASCII.sublist(
      startIndex,
      (startIndex + itemsPerPage).clamp(0, tablaASCII.length),
    );

    // Dividir los elementos en pares para crear las filas
    List<List<String>> filas = [];
    for (int i = 0; i < currentItems.length; i += 2) {
      filas.add(currentItems.sublist(i, (i + 2).clamp(0, currentItems.length)));
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF81D4FA), Color(0xFF4FC3F7)], // Gradiente de tonos azules suaves
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(
              Icons.assignment_rounded,
              size: 120,
              color: Color(0xFF0288D1), // Azul más suave
            ),
            const SizedBox(height: 20),
            const Text(
              'Tabla ASCII',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Arial',
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black26,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Table(
                    border: TableBorder.all(color: Colors.black38, width: 1),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                    },
                    children: filas.map((fila) {
                      return TableRow(
                        children: fila.map((celda) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              celda,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavButton(
                  icon: Icons.arrow_back,
                  label: 'Anterior',
                  onPressed: startIndex > 0
                      ? () {
                    setState(() {
                      startIndex -= itemsPerPage;
                    });
                  }
                      : null,
                  isEnabled: startIndex > 0,
                ),
                _buildNavButton(
                  icon: Icons.arrow_forward,
                  label: 'Siguiente',
                  onPressed: startIndex + itemsPerPage < tablaASCII.length
                      ? () {
                    setState(() {
                      startIndex += itemsPerPage;
                    });
                  }
                      : null,
                  isEnabled: startIndex + itemsPerPage < tablaASCII.length,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildBackButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _buildNavButton({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
    required bool isEnabled,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 24),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? const Color(0xFF4CAF50) // Verde suave para los botones de navegación
              : Colors.grey, // Deshabilitado
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          elevation: 10,
        ),
      ),
    );
  }

  ElevatedButton _buildBackButton() {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context); // Regresar al menú
      },
      icon: const Icon(Icons.arrow_back_rounded),
      label: const Text(
        'Volver',
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: const Color(0xFFD32F2F), // Rojo suave para el botón Volver
        foregroundColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
