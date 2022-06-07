import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/post_detail/post_detail_bloc.dart';
import 'package:flutter_todo/models/post.dart';

class PostDetailScreen extends StatelessWidget {
  final int postId;

  const PostDetailScreen({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostDetailBloc>(
      create: (context) => PostDetailBloc(postId: postId),
      child: const PostDetailWidget(),
    );
  }
}

class PostDetailWidget extends StatelessWidget {
  const PostDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Detail'),
        ),
        body: BlocBuilder<PostDetailBloc, PostDetailState>(
          builder: (context, state) {
            if (state is PostDetailLoadSuccess) {
              return _buildContent(context, post: state.post);
            } else if (state is PostDetailLoadFailure) {
              // should show some error message
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _buildContent(BuildContext context, {required Post post}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Post Id: ${post.id}'),
              const Spacer(),
              Text('User Id: ${post.userId}'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Title: ${post.title}'),
          const SizedBox(
            height: 15,
          ),
          if (post.body != null) Text('Description: \n${post.body!}'),
        ],
      ),
    );
  }
}
