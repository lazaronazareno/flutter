import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/class/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState.initial()) {
    on<AddTaskEvent>((event, emit) {
      final newList = List<Task>.from(state.tasks);
      newList.add(Task(title: event.title));
      emit(state.copyWith(tasks: newList));
    });

    on<UpdateStateEvent>((event, emit) {
      final newList = List<Task>.from(state.tasks);
      newList[event.index] = newList[event.index].isComplete
          ? Task(title: newList[event.index].title)
          : Task(title: newList[event.index].title, isComplete: true);
      emit(state.copyWith(tasks: newList));
    });
  }
}
