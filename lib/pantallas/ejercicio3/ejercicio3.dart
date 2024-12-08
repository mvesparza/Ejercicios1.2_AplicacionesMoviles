import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultado3.dart'; // Pantalla Resultado3
import '../../logica/logicaejer3.dart'; // Lógica del ejercicio 3

class Ejercicio3Page extends StatelessWidget {
  Ejercicio3Page({super.key});

  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC), Color(0xFFD1C4E9)], // Colores de fondo vibrantes
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.settings_applications_rounded,
                size: 120,
                color: Color(0xFF29B6F6),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ejercicio 3: MCD de dos números',
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
              _buildTextField('Primer número', _num1Controller),
              const SizedBox(height: 20),
              _buildTextField('Segundo número', _num2Controller),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  String input1 = _num1Controller.text;
                  String input2 = _num2Controller.text;

                  // Validaciones para los números
                  if (input1.isEmpty || input2.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Los campos no pueden estar vacíos')),
                    );
                    return;
                  }

                  int? num1 = int.tryParse(input1);
                  int? num2 = int.tryParse(input2);

                  if (num1 == null || num2 == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ingrese solo números enteros')),
                    );
                    return;
                  }

                  if (num1 <= 0 || num2 <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Los números deben ser positivos')),
                    );
                    return;
                  }

                  // Calcular el MCD
                  int resultado = calcularMCD(num1, num2);

                  // Navegar a la pantalla de resultado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Resultado3Page(resultado: resultado),
                    ),
                  );
                },
                icon: const Icon(Icons.calculate_rounded, size: 24),
                label: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9C27B0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Volver a la pantalla anterior
                },
                icon: const Icon(Icons.arrow_back_rounded, size: 24),
                label: const Text(
                  'Volver',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD32F2F),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
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
