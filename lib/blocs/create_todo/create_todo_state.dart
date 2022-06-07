part of 'create_todo_bloc.dart';

@immutable
abstract class CreateTodoState {
  const CreateTodoState();

  @override
  List<Object> get props => [];
}

class CreateTodoInitial extends CreateTodoState {}

class CreateTodoSuccess extends CreateTodoState {
  final Todo todo;

  const CreateTodoSuccess({required this.todo});

  @override
  List<Object> get props => [todo];

  @override
  String toString() {
    return 'CreateTodoSuccess { todo: $todo }';
  }
}

class CreateTodoFailure extends CreateTodoState {}
