import 'package:flutter/material.dart';
import '../../logica/logicaejer5.dart'; // Lógica del ejercicio 5

class Ejercicio5Page extends StatelessWidget {
  Ejercicio5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF42A5F5), Color(0xFF1E88E5), Color(0xFF0D47A1)],
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
                color: Color(0xFFFFEB3B), // Amarillo brillante
              ),
              const SizedBox(height: 20),
              const Text(
                'Ejercicio 5: Números Primos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Comic Sans MS',
                ),
              ),
              const SizedBox(height: 20),
              // Llamamos la función de la lógica y mostramos el resultado en tablas organizadas
              FutureBuilder<List<int>>(
                future: obtenerNumerosPrimos(), // Lógica para obtener primos entre 3 y 32767
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No se encontraron números primos.');
                  } else {
                    List<int> primos = snapshot.data!;

                    return Expanded(
                      child: SingleChildScrollView(
                        child: Table(
                          border: TableBorder.all(color: Colors.white),
                          children: [
                            // Filas con los números primos
                            for (int i = 0; i < primos.length; i += 5)
                              TableRow(
                                children: [
                                  for (int j = i; j < i + 5; j++)
                                    j < primos.length
                                        ? Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.center,
                                      color: (i + j) % 2 == 0
                                          ? Colors.blue[50]
                                          : Colors.blue[100], // Alternancia de colores
                                      child: Text(
                                        primos[j].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                    )
                                        : Container(), // En caso de que no haya más números
                                ],
                              ),
                          ],
                        ),
                      ),
                    );
                  }
                },
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
                  backgroundColor: const Color(0xFFD32F2F), // Verde
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
