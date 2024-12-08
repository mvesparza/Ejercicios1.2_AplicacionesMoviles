import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultado4.dart'; // Pantalla Resultado4
import '../../logica/logicaejer4.dart'; // Lógica del ejercicio 4

class Ejercicio4Page extends StatelessWidget {
  Ejercicio4Page({super.key});

  final TextEditingController _numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF64B5F6), Color(0xFFBBDEFB)], // Gradiente azul claro
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calculate_rounded,
                size: 120,
                color: Color(0xFFFF7043), // Naranja brillante
              ),
              const SizedBox(height: 20),
              const Text(
                'Ejercicio 4: Factorización de un número',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
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
              const SizedBox(height: 20),
              _buildTextField('Número a factorizar', _numController),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  String input = _numController.text;

                  // Validaciones de entrada
                  if (input.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('El campo no puede estar vacío')),
                    );
                    return;
                  }

                  int? num = int.tryParse(input);

                  // Verificar que el número sea entero y positivo
                  if (num == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ingrese solo números enteros')),
                    );
                    return;
                  }
                  if (num <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('El número debe ser mayor que 0')),
                    );
                    return;
                  }

                  // Calcular el resultado
                  List<Map<String, int>> resultado = factorizar(num);

                  // Navegar a la pantalla de resultado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Resultado4Page(resultado: resultado),
                    ),
                  );
                },
                icon: const Icon(Icons.calculate_rounded, size: 24),
                label: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7043), // Naranja brillante
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
                  backgroundColor: const Color(0xFFD32F2F), // Azul brillante
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.white12,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Solo números
        ],
      ),
    );
  }
}
