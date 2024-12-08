List<String> generarTablaASCII() {
  List<String> tabla = [];
  for (int n = 0; n <= 255; n++) {
    // Verificar si el carácter es representable (visible)
    String char;
    if (n >= 32 && n <= 126) {
      char = String.fromCharCode(n); // Caracter visible
    } else {
      char = ' '; // Sustituir caracteres no visibles con un espacio vacío
    }
    // Agregar el número ASCII y el carácter correspondiente
    tabla.add('${n.toString().padLeft(3)} = \'$char\'');
  }
  return tabla;
}
