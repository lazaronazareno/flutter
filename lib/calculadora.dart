import 'dart:io';

void main() {
  // 1: Suma
  // 2: Resta
  // 3: Multiplicación
  // 4: División
  print("Aplicacion calculadora");
  stdout.write("Ingrese una operacion: ");
  String opcion = stdin.readLineSync()!;

  print(opcion);

  stdout.write("Ingrese el primer número: ");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Ingrese el segundo número: ");
  int num2 = int.parse(stdin.readLineSync()!);

  switch (opcion) {
    case "suma":
      print("La suma es: ");
      print(num1 + num2);

    case "resta":
      print("la resta es");
      print(num1 - num2);

    case "multiplicacion":
      print("la multiplicacion es");
      print(num1 * num2);

    case "division":
      print("la division es");
      print(num1 / num2);

    default:
      print("Opcion no valida");
  }
}
