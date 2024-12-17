import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_bloc/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBlocPage extends StatelessWidget {
  const TodoBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    //primer paso luego de setear evento, state y bloc
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Bloc"),
      ),
      body: Column(
        children: [
          //segundo paso
          Expanded(child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state.tasks.isEmpty) {
                return const Center(
                  child: Text("No hay tareas"),
                );
              }
              return ListView.builder(
                //tamaño lista del state
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  //definir task como variable
                  final task = state.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing: Checkbox(
                        value: task.isComplete,
                        onChanged: (value) {
                          context
                              .read<TodoBloc>()
                              .add(UpdateStateEvent(index: index));
                        }),
                  );
                },
              );
            },
          )),
          TodoInputText(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class TodoInputText extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TodoInputText({super.key});

  _addTask(BuildContext context) {
    TodoBloc todoBloc = context.read<TodoBloc>();
    if (_controller.text.isNotEmpty) {
      todoBloc.add(AddTaskEvent(title: _controller.text));
    }
    _controller.clear();
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
