part of 'create_todo_bloc.dart';

@immutable
abstract class CreateTodoEvent {
  const CreateTodoEvent();

  @override
  List<Object?> get props => [];
}

class CreateTodoRequested extends CreateTodoEvent {
  final String title;

  const CreateTodoRequested({required this.title});

  @override
  List<Object> get props => [title];

  @override
  String toString() {
    return 'CreateTodoRequested { title: $title }';
  }
}
