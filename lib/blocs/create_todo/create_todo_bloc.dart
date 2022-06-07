import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/network/repository/todo_repository.dart';
import 'package:meta/meta.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  final _todoRepository = TodoRepository();
  CreateTodoBloc() : super(CreateTodoInitial()) {
    on<CreateTodoRequested>(_onCreateTodoRequested);
  }

  void _onCreateTodoRequested(
      CreateTodoRequested event, Emitter<CreateTodoState> emit) async {
    try {
      /// hardcode assume userId is 1
      final todo =
          await _todoRepository.createTodo(userId: 1, title: event.title);
      emit(CreateTodoSuccess(todo: todo));
    } catch (e) {
      emit(CreateTodoFailure());
    }
  }
}
