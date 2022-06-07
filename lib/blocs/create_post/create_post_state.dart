part of 'create_post_bloc.dart';

@immutable
abstract class CreatePostState {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {
  final Post post;

  const CreatePostSuccess({required this.post});

  @override
  List<Object> get props => [post];

  @override
  String toString() {
    return 'CreatePostSuccess { post: $post }';
  }
}

class CreatePostFailure extends CreatePostState {}
