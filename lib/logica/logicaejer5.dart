Future<List<int>> obtenerNumerosPrimos() async {
  List<int> primos = [];
  for (int numero = 3; numero <= 32767; numero++) {
    bool esPrimo = true;
    for (int x = 2; x < numero; x++) {
      if (numero % x == 0) {
        esPrimo = false;
        break;
      }
    }
    if (esPrimo) primos.add(numero);
  }
  return primos;
}
