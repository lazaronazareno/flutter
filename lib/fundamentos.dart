void main() {
  print("Hola mundo");

  //variables();
  //listaYmapa();
  //operadores();
  //control();
  //listaAlumnos();
  //saludar('Juan', 'Perez');
  //saludar2(nombre: 'Juan', apellido: 'Perez');
  obtenerClima();
}

void variables() {
  //asumen el valor
  var ciudad = "Buenos Aires";
  var temp = 30.0;

  int edad = 70;
  double pi = 3.1416;
  bool activo = true;
  String nombre = "Juan";
  //String _nombrePrivado = "Juan";

  print("La ciudad es $ciudad");
  print("La temperatura es $temp");
  print("La edad es $edad");
  print("El valor de pi es $pi");
  print("Activo: $activo");
  print("Nombre: $nombre");
}

void listaYmapa() {
  List<String> colores = ["Rojo", "Verde", "Azul"];
  Map<String, int> edades = {"Juan": 30, "Maria": 25, "Pedro": 40};
}

void operadores() {
  int a = 10;
  int b = 20;

  print("Suma");
  print(a + b);

  print("Resta");
  print(a - b);

  print("Multiplicación");
  print(a * b);

  print("División");
  print(a / b);

  print("Módulo");
  print(a % b);

  print("Incremento");
  print(++a);

  print("Decremento");
  print(--b);

  print("Operadores de comparación");
  print(a > b);
  print(a >= b);
  print(a < b);
  print(a == b);
  print(a != b);
}

void control() {
  int edad = 18;

  if (edad >= 18) {
    print("Es mayor de edad");
  } else {
    print("Es menor de edad");
  }

  String diaSemana = "Lunes";

  switch (diaSemana) {
    case "Lunes":
      print("Es lunes");
      break;
    case "Martes":
      print("Es martes");
      break;
    default:
      print("No es lunes ni martes");
  }

  for (int i = 0; i < 3; i++) {
    print(i);
  }

  //es mas rapido en rendimiento
  for (var color in ["Rojo", "Verde", "Azul"]) {
    print(color);
  }

  int i = 0;
  while (i < 3) {
    print(i);
    i++;
  }
}

class Alumns {
  final String nombre;
  final int edad;

  Alumns({required this.nombre, required this.edad});

  void mostrar() {
    print("Nombre: $nombre, Edad: $edad");
  }

  @override
  String toString() {
    return "Nombre: $nombre, Edad: $edad";
  }
}

void listaAlumnos() {
  /* final List<Alumns> alumnos = [
    Alumns("Juan", 20),
    Alumns("Maria", 25),
    Alumns("Pedro", 30)
  ]; */

  final List<Alumns> alumnos = [
    Alumns(nombre: "Juan", edad: 20),
    Alumns(nombre: "Maria", edad: 25),
    Alumns(nombre: "Pedro", edad: 30)
  ];

  alumnos.map((alumno) => alumno.mostrar()).toList();
}

//posicional
void saludar(String nombre, [String apellido = ""]) {
  print("Hola $nombre $apellido");
}

void saludar2({required String nombre, String apellido = ""}) {
  print("Hola $nombre $apellido");
}

Future<String> clima() async {
  await Future.delayed(const Duration(seconds: 3));
  return "Hace 30°";
}

Future<String> obtenerClima() async {
  String datosClima = await clima();
  print(datosClima);
  return datosClima;
}

class Animal {
  void emitirSonido() {
    print("Sonido de animal");
  }
}

class Perro extends Animal {
  @override
  void emitirSonido() {
    print("Guau guau");
  }
}

class Gato extends Animal {
  @override
  void emitirSonido() {
    print("Miau miau");
  }
}
