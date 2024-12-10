import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});

  final List<String> images = [
    "https://picsum.photos/250?image=1"
        "https://picsum.photos/250?image=2"
        "https://picsum.photos/250?image=3"
        "https://picsum.photos/250?image=4"
        "https://picsum.photos/250?image=5"
        "https://picsum.photos/250?image=6"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galería de Imágenes"),
      ),
      body: Center(
        child: Image.network(
          'https://picsum.photos/250?image=9',
        ),
      ),
    );
  }
}


//Mini app de imagenes
// - Grid/Mosaico de imagenes (n) Gridview
// - Ver una imagen en pantalla completa, imagenes en url (averiguar widget(alertDialog) o hacer que vaya a una pantalla nueva con la imagen completa)
// - Modificar la cantidad de elementos en la grilla (n), input para cambiar la cantidad
// - Boton (UI a eleccion) para agregar una imagen a la galeria