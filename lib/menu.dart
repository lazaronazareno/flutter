import 'package:flutter/material.dart';
import 'package:flutter_application_1/audio_player/player.dart';
import 'package:flutter_application_1/entradas_de_datos/in_datos.dart';
import 'package:flutter_application_1/gallery/gallery.dart';
import 'package:flutter_application_1/gestor_habitos/home_hab.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeHabitosPage(),
                  ),
                );
              },
              child: const Text("Gestor de Habitos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InDatos(),
                  ),
                );
              },
              child: const Text("Widgets de entrada de datos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GalleryPage(),
                  ),
                );
              },
              child: const Text("Galería de Imágenes"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AudioPlayerPage(),
                  ),
                );
              },
              child: const Text("Reproductor de Audio"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Todo - Provider"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Todo - Bloc"),
            ),
          ],
        ),
      ),
    );
  }
}
