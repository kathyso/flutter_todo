import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/post/posts_bloc.dart';
import 'package:flutter_todo/models/post.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (context) => PostsBloc(),
      child: const PostsWidget(),
    );
  }
}

class PostsWidget extends StatelessWidget {
  const PostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadSuccess) {
            return _buildContent(context, posts: state.posts);
          }
          // TODO: error handling
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: create post
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required List<Post> posts}) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Text('item $index');
        });
  }
}
