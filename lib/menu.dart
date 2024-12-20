import 'package:flutter/material.dart';
import 'package:flutter_application_1/adopt_app/adopt_app.dart';
import 'package:flutter_application_1/audio_player/player.dart';
import 'package:flutter_application_1/entradas_de_datos/in_datos.dart';
import 'package:flutter_application_1/gallery/gallery.dart';
import 'package:flutter_application_1/gestor_habitos/home_hab.dart';
import 'package:flutter_application_1/todo_bloc/todo_bloc_page.dart';
import 'package:flutter_application_1/todo_provider/todo_provider.dart';
import 'package:flutter_application_1/video_player_design/video_player_design.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoPlayerDesign(),
                  ),
                );
              },
              child: const Text("Video player design"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoProvider(),
                  ),
                );
              },
              //para proyectos un poco mas simples y no tan complejos, más facil de aprender, escalabilidad limitada, mantenimiento moderado, optimizacion promedio
              child: const Text("Todo - Provider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoBlocPage(),
                  ),
                );
              },
              //para proyectos un poco mas grandes y complejos, moderada dificultad de aprendizaje, escalabilidad muy alta, mantenimiento alto, estructura rigida, optimizacion excelente
              child: const Text("Todo - Bloc"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdoptAppPage(),
                  ),
                );
              },
              //para proyectos un poco mas grandes y complejos, moderada dificultad de aprendizaje, escalabilidad muy alta, mantenimiento alto, estructura rigida, optimizacion excelente
              child: const Text("Adopt App"),
            ),
          ],
        ),
      ),
    );
  }
}
