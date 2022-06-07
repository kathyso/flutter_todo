part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListEvent {
  const TodoListEvent();

  @override
  List<Object?> get props => [];
}

class TodoListInitialized extends TodoListEvent {}
