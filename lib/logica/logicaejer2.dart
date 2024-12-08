// Función para calcular el factorial de un número.
double calcularFactorial(int numero) {
  // Inicializamos la variable 'factorial' en 1, ya que el factorial de cualquier número
  // se calcula multiplicando una serie de números y el valor inicial debe ser 1.
  double factorial = 1;

  // Usamos un bucle for para iterar desde 1 hasta el número que nos pase el usuario.
  // En cada iteración, multiplicamos el valor actual de 'factorial' por el valor de 'i'.
  for (int i = 1; i <= numero; i++) {
    factorial *= i; // Multiplicamos el valor acumulado de 'factorial' por 'i'.
  }

  // Al final del bucle, 'factorial' contiene el resultado del cálculo y lo retornamos.
  return factorial;
}
