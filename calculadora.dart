import 'dart:html';

void main() {
  // Obtener los elementos del HTML
  ButtonElement sumarButton = querySelector('#sumar') as ButtonElement;
  ButtonElement restarButton = querySelector('#restar') as ButtonElement;
  InputElement num1Input = querySelector('#num1') as InputElement;
  InputElement num2Input = querySelector('#num2') as InputElement;
  HeadingElement resultado = querySelector('#resultado') as HeadingElement;

  // Función para realizar la operación
  void calcular(String operacion) {
    double num1 = double.parse(num1Input.value!);
    double num2 = double.parse(num2Input.value!);
    double res;

    if (operacion == 'sumar') {
      res = num1 + num2;
    } else {
      res = num1 - num2;
    }

    resultado.text = 'El resultado es: $res';
  }

  // Asociar los botones con las funciones
  sumarButton.onClick.listen((event) => calcular('sumar'));
  restarButton.onClick.listen((event) => calcular('restar'));
}
