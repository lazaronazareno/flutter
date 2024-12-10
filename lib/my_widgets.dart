import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  final title = "My Navbar";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Floating button pressed");
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          //leading: const Icon(Icons.arrow_back),
          leading: const Row(
            children: [
              Icon(Icons.menu),
              //Text("a"),
              //Icon(Icons.person),
            ],
          ),
          actions: const [
            Icon(Icons.person),
          ],
        ),
        /* body: Column(
          children: [
            const Text("Ejemplo 1",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            const Text("Ejemplo 2"),
            Text("Ejemplo 3",
                style: TextStyle(
                  color: Colors.amber[600],
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Arial",
                  letterSpacing: 2,
                )),
          ],
        ), */
        /* body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Container(
              color: Colors.amber,
              width: 200,
              height: 200,
            ),
            Positioned(
                top: 50,
                right: 0,
                child: Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                )),
            Container(
              color: Colors.red,
              width: 25,
              height: 25,
            ),
          ]),
        ), */
        body: Container(
          height: size.height / 2,
          color: Colors.deepPurple[500],
        ),
      ),
    );
  }

  Widget myButtonFloating() {
    return FloatingActionButton(
      onPressed: () {
        print("Floating button pressed");
      },
      child: const Icon(Icons.add),
    );
  }
}
