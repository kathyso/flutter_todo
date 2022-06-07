import 'dart:convert';

import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/network/api_manager.dart';
import 'package:flutter_todo/network/http_method.dart';
import 'package:flutter_todo/utils/network_constants.dart';

class PostClient {
  static String get _baseUrl {
    return NetworkConstants.baseUrl;
  }

  static ApiManager get _api {
    return ApiManager();
  }

  Future<List<Post>> fetchPosts() async {
    final url = '$_baseUrl/posts';

    try {
      final response = await _api.request(HttpMethod.get, url);
      final decoded = jsonDecode(response.body);

      final post =
          (decoded as List).map((data) => Post.fromJson(data)).toList();

      return post;
    } catch (e) {
      rethrow;
    }
  }
}
