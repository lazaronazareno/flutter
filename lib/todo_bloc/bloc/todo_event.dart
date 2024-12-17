part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TodoEvent {
  final String title;

  const AddTaskEvent({required this.title});
}

class UpdateStateEvent extends TodoEvent {
  final int index;

  const UpdateStateEvent({required this.index});
}
