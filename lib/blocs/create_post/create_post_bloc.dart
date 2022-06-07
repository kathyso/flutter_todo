import 'package:bloc/bloc.dart';
import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/network/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final PostRepository _postRepository = PostRepository();

  CreatePostBloc() : super(CreatePostInitial()) {
    on<CreatePostRequested>(_onCreatePostRequested);
  }

  void _onCreatePostRequested(
      CreatePostRequested event, Emitter<CreatePostState> emit) async {
    try {
      /// hardcode assume userId is 1
      final post = await _postRepository.createPost(
          userId: 1, title: event.title, body: event.body);
      emit(CreatePostSuccess(post: post));
    } catch (e) {
      emit(CreatePostFailure());
    }
  }
}
