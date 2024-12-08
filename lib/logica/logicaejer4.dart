List<Map<String, int>> factorizar(int n) {
  List<Map<String, int>> factores = [];
  int factor = 2;
  int potencia = 0;

  while (n > 1) {
    while (n % factor == 0) {
      potencia++;
      n = n ~/ factor; // División entera
    }

    if (potencia > 0) {
      factores.add({'factor': factor, 'potencia': potencia});
      potencia = 0;
    }

    factor++;
  }

  return factores;
}
