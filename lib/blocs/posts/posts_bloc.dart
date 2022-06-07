import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/network/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository _postRepository = PostRepository();

  PostsBloc() : super(PostsLoadInProgress()) {
    on<PostsInitialized>(_onPostsInitialized);

    add(PostsInitialized());
  }

  void _onPostsInitialized(
      PostsInitialized event, Emitter<PostsState> emit) async {
    try {
      /// fetch all posts of userId
      /// hardcode assume userId is 1
      final posts = await _postRepository.fetchPosts(userId: 1);
      emit(PostsLoadSuccess(posts: posts));
    } catch (e) {
      emit(PostsLoadFailure());
    }
  }
}
