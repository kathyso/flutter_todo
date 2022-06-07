import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/network/client/todo_client.dart';

class TodoRepository {
  final TodoClient _client;

  static final TodoRepository _instance = TodoRepository._(TodoClient());

  factory TodoRepository() {
    return _instance;
  }

  TodoRepository._(this._client);

  Future<List<Todo>> fetchTodoList({required int userId}) async {
    try {
      final result = await _client.fetchTodoList(userId: userId);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Todo> fetchTodoDetail({required int todoId}) async {
    try {
      final result = await _client.fetchTodoDetail(todoId: todoId);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Todo> createTodo(
      {required int userId,
      required String title,
      required bool completed}) async {
    try {
      final todo = Todo(userId: userId, title: title, completed: completed);
      final data = todo.toJson();
      final result = await _client.createTodo(data: data);
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }
}
