import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/network/api_manager.dart';
import 'package:flutter_todo/network/http_method.dart';
import 'package:flutter_todo/utils/network_constants.dart';

class TodoClient {
  static String get _baseUrl {
    return NetworkConstants.baseUrl;
  }

  static ApiManager get _api {
    return ApiManager();
  }

  Future<List<Todo>> fetchTodoList({required int userId}) async {
    final url = '$_baseUrl/todos?userId=$userId';

    try {
      final response = await _api.request(HttpMethod.get, url);
      final todos = (response.data as List).map((data) {
        return Todo.fromJson(data);
      }).toList();
      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<Todo> fetchTodoDetail({required int todoId}) async {
    final url = '$_baseUrl/todos/$todoId';

    try {
      final response = await _api.request(HttpMethod.get, url);
      final todo = Todo.fromJson(response.data);
      return todo;
    } catch (e) {
      rethrow;
    }
  }

  Future<Todo> createTodo({required Map<String, dynamic> data}) async {
    final url = '$_baseUrl/todos';

    try {
      final response = await _api.request(HttpMethod.post, url, data: data);
      final todo = Todo.fromJson(response.data);
      return todo;
    } catch (e) {
      rethrow;
    }
  }
}
