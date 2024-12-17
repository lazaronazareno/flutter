part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<Task> tasks;

  const TodoState({
    required this.tasks,
  });

  factory TodoState.initial() {
    return const TodoState(tasks: []);
  }

  //hacer siempre la misma copia con las mismas variables definidas arriba pero con nullsafety para modificar solo las que se necesiten modificar
  TodoState copyWith({List<Task>? tasks}) {
    return TodoState(tasks: tasks ?? this.tasks);
  }

  @override
  List<Object> get props =>
      [tasks]; //todas las variables que se inicializan en el constructor
}
