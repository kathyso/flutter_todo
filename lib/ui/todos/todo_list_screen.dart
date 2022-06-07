import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/todo_list/todo_list_bloc.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoListBloc>(
      create: (context) => TodoListBloc(),
      child: const TodoListWidget(),
    );
  }
}

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          if (state is TodoListLoadSuccess) {
            return _buildContent(context, todoList: state.todoList);
          } else if (state is TodoListLoadFailure) {
            // should show some error message
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _routeToCreatePostScreen(context);
        },
        tooltip: 'Create TODO',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required List<Todo> todoList}) {
    return ListView.separated(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return _buildItem(context, todo: todoList[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  Widget _buildItem(BuildContext context, {required Todo todo}) {
    return ListTile(
      title: Text(todo.title),
      trailing: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // For vertical center the arrow icon
        children: [
          if (todo.completed)
          const Icon(Icons.check_box)
          else
          const Icon(Icons.check_box_outline_blank)
        ],
      ),
      onTap: () {
        // if (post.id != null) {
        //   _routeToPostDetailScreen(context, postId: post.id!);
        // }
      },
    );
  }

  // void _routeToPostDetailScreen(BuildContext context, {required int postId}) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) {
  //       return PostDetailScreen(postId: postId);
  //     }),
  //   );
  // }

  // void _routeToCreatePostScreen(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       fullscreenDialog: true,
  //       builder: (context) {
  //       return const CreatePostScreen();
  //     }),
  //   );
  // }
}
