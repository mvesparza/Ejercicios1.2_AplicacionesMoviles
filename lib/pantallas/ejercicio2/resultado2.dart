import 'package:flutter/material.dart';
import '../../logica/logicaejer2.dart'; // Importa la lógica del ejercicio 2

class Resultado1Page extends StatelessWidget {
  final int numero;

  const Resultado1Page({required this.numero, super.key});

  @override
  Widget build(BuildContext context) {
    double resultado = calcularFactorial(numero);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF7043), Color(0xFFFF8A65), Color(0xFFFFAB91)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.assignment_rounded,
                size: 120,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              Text(
                '$numero! = $resultado',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Volver'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD32F2F), // Azul claro
                  foregroundColor: Colors.white,
                  elevation: 10,
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
