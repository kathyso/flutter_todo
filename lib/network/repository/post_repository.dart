import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/network/client/post_client.dart';

class PostRepository {
  final PostClient _client;

  static final PostRepository _instance = PostRepository._(PostClient());

  factory PostRepository() {
    return _instance;
  }

  PostRepository._(this._client);

  Future<List<Post>> fetchPosts() async {
    try {
      final result = await _client.fetchPosts();
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }
}
