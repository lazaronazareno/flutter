import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/task.dart';
import 'package:provider/provider.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [Task(title: "Tarea 1")];

  addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  updateStatus(int index) {
    _tasks[index].isComplete = !_tasks[index].isComplete;
    notifyListeners();
  }
}

class TodoProvider extends StatelessWidget {
  const TodoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo Provider"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: taskProvider._tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = taskProvider._tasks[index];

                  return ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                          decoration: task.isComplete
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    trailing: Checkbox(
                        value: task.isComplete,
                        onChanged: (value) => taskProvider.updateStatus(index)),
                  );
                },
              ),
            ),
            TodoInputText(),
            const SizedBox(height: 32),
          ],
        ));
  }
}

class TodoInputText extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TodoInputText({super.key});

  _addTask(BuildContext context) {
    //listen: false para que no se redibuje el widget, no se necesita en este widget por que solo se necesita acceder al metodo
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    if (_controller.text.isNotEmpty) {
      taskProvider.addTask(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            //textfield no tiene height definido, por eso necesita el expanded
            decoration: const InputDecoration(
                labelText: "Nueva tarea", border: OutlineInputBorder()),
          )),
          ElevatedButton(
              onPressed: () => _addTask(context), child: const Text("Agregar")),
        ],
      ),
    );
  }
}
