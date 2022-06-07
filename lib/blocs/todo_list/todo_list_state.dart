part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListState {
  const TodoListState();

  @override
  List<Object> get props => [];
}

class TodoListLoadInProgress extends TodoListState {}

class TodoListLoadSuccess extends TodoListState {
  final List<Todo> todoList;

  const TodoListLoadSuccess({required this.todoList});

  @override
  List<Object> get props => [todoList];

  @override
  String toString() {
    return 'TodoListLoadSuccess { todoList: $todoList }';
  }
}

class TodoListLoadFailure extends TodoListState {}
