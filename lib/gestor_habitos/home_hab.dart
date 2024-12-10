import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gestor_habitos/new_habit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHabitosPage extends StatefulWidget {
  const HomeHabitosPage({super.key});

  @override
  State<HomeHabitosPage> createState() => _HomeHabitosPageState();
}

class _HomeHabitosPageState extends State<HomeHabitosPage> {
  final List<Habit> habits = [];

  //esto seria como el localStorage de js
  late final SharedPreferences prefs;

  String? action;

  @override
  void initState() {
    super.initState();
    initShared();
  }

  initShared() async {
    prefs = await SharedPreferences.getInstance();
    getData();
  }

  saveData() async {
    await prefs.setString('test', 'Test 1');
    getData();
  }

  getData() {
    setState(() {
      action = prefs.getString('test') ?? "sin datos";
    });
    log(action!);
  }

  void _addHabit(String name, String desc) {
    setState(() {
      habits.add(Habit(name: name, description: desc));
    });
    log(habits.toString());
  }

  void changeStatus(int i) {
    setState(() {
      habits[i].isComplete = !habits[i].isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gestor de habitos ($action)"),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, i) {
              String name = habits[i].name;
              String desc = habits[i].description;
              bool isComplete = habits[i].isComplete;

              return ListTile(
                onTap: () => changeStatus(i),
                title: Text(name),
                subtitle: Text(desc),
                trailing: isComplete
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.circle_outlined),
              );
            },
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              saveData();
            },
            child: const Icon(Icons.save),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            //esto es como un id, un identificador, una key, tiene que ser unico para componentes repetidos
            heroTag: "btn2",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewHabit(
                    submitHabit: _addHabit,
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          )
        ]));
  }
}

class Habit {
  String name;
  String description;
  bool isComplete;

  Habit({
    required this.name,
    required this.description,
    this.isComplete = false,
  });

  @override
  String toString() {
    return "name: $name, description: $description, isComplete: $isComplete";
  }
}
