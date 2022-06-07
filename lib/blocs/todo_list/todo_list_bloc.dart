import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/network/repository/todo_repository.dart';
import 'package:meta/meta.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final _todoRepository = TodoRepository();

  TodoListBloc() : super(TodoListLoadInProgress()) {
    on<TodoListInitialized>(_onTodoListInitialized);

    add(TodoListInitialized());
  }

  void _onTodoListInitialized(
      TodoListInitialized event, Emitter<TodoListState> emit) async {
    try {
      /// fetch all todos of userId
      /// hardcode assume userId is 1
      final todoList = await _todoRepository.fetchTodoList(userId: 1);
      emit(TodoListLoadSuccess(todoList: todoList));
    } catch (e) {
      emit(TodoListLoadFailure());
    }
  }
}
