part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

class PostsInitialized extends PostsEvent {}
