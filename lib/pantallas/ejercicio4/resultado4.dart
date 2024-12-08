import 'package:flutter/material.dart';

class Resultado4Page extends StatelessWidget {
  final List<Map<String, int>> resultado;

  const Resultado4Page({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF81C784), Color(0xFFA5D6A7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calculate_rounded,  // Ícono similar al de la página principal
                size: 120,
                color: Color(0xFF0288D1),  // Azul brillante
              ),
              const SizedBox(height: 20),
              const Text(
                'La factorización es:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Comic Sans MS',
                ),
              ),
              const SizedBox(height: 20),
              for (var factor in resultado)
                Text(
                  'Factor: ${factor['factor']}^${factor['potencia']}',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              const SizedBox(height: 30),
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
                  backgroundColor: const Color(0xFFD32F2F), // Azul vibrante
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
}
