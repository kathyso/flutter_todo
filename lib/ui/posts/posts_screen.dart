import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/posts/posts_bloc.dart';
import 'package:flutter_todo/models/post.dart';
import 'package:flutter_todo/ui/posts/create_post_screen.dart';
import 'package:flutter_todo/ui/posts/post_detail_screen.dart';

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
          } else if (state is PostsLoadFailure) {
            // should show some error message
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _routeToCreatePostScreen(context);
        },
        tooltip: 'Create post',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required List<Post> posts}) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return _buildItem(context, post: posts[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  Widget _buildItem(BuildContext context, {required Post post}) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(
        post.body ?? '', // show empty string if post.body is null
        maxLines: 2,
      ),
      trailing: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // For vertical center the arrow icon
        children: const [
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () {
        if (post.id != null) {
          _routeToPostDetailScreen(context, postId: post.id!);
        }
      },
    );
  }

  void _routeToPostDetailScreen(BuildContext context, {required int postId}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return PostDetailScreen(postId: postId);
      }),
    );
  }

  void _routeToCreatePostScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
        return const CreatePostScreen();
      }),
    );
  }
}
