import 'dart:developer';

import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> images = [
    "https://picsum.photos/250?image=1",
    "https://picsum.photos/250?image=2",
    "https://picsum.photos/250?image=3",
    "https://picsum.photos/250?image=4",
  ];

  int cantGalleryImagesView = 2;

  addImage() {
    int lastIndex = int.parse(images.last.split("=").last);
    log(lastIndex.toString());
    setState(() {
      images.add("https://picsum.photos/250?image=${lastIndex + 1}");
    });
  }

  changeImageView(int cant) {
    setState(() {
      cantGalleryImagesView = cant;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xFF275846),
        body: Column(
          children: [
            const SafeArea(
                child: SizedBox(
              height: 24,
            )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: headerSection(context)),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(width: size.width, child: textSection())),
            const SizedBox(
              height: 32,
            ),
            bodySection()
          ],
        ));
  }

  Widget headerSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white38),
                borderRadius: BorderRadius.circular(16)),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: addImage,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget textSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Gallery",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Created today",
          style: TextStyle(
            color: Colors.white54,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget bodySection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Column(children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Recently Added",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        changeImageView(2);
                      },
                      icon: const Icon(Icons.two_k_outlined)),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      changeImageView(3);
                    },
                    icon: const Icon(Icons.three_k_outlined),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cantGalleryImagesView,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    /* image: DecorationImage(
                          image: NetworkImage(images[index]), fit: BoxFit.cover), */
                  ),
                  child: GestureDetector(
                    onTap: () => _dialogBuilder(context, images[index]),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  Future _dialogBuilder(BuildContext context, String imageUrl) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Dialog.fullscreen(
              child: Column(
                children: [
                  Image.network(
                    imageUrl,
                    height: 500,
                    width: 500,
                    fit: BoxFit.cover,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close))
                ],
              ),
            ),
          );
        });
  }
}

//Mini app de imagenes
// - Grid/Mosaico de imagenes (n) Gridview
// - Ver una imagen en pantalla completa, imagenes en url (averiguar widget(alertDialog) o hacer que vaya a una pantalla nueva con la imagen completa)
// - Modificar la cantidad de elementos en la grilla (n), input para cambiar la cantidad
// - Boton (UI a eleccion) para agregar una imagen a la galeria

//  ejercicio 1
// - agregar las imagenes
// - bordes redondeados
// - que aparezca en la galeria la imagen agregada desde el boton del header

//  ejercicio 2
// - modificar la cantidad de elementos en la grilla
// - ver la imagen al hacer click en la imagen
// - Dialog, Navigator to Image FullScreen

/* Center(
        child: Image.network(
          width: 250,
          height: 250,
          'https://picsum.photos/250?image=9',
        ),
      ) */

//row sirve para dar 100% width a un elemento
//column sirve para dar 100% height a un elemento

class ImageView extends StatelessWidget {
  final String image;

  const ImageView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Image.network(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
