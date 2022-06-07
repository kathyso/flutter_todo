import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/create_post/create_post_bloc.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePostBloc>(
      create: (context) => CreatePostBloc(),
      child: const CreatePostWidget(),
    );
  }
}

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({Key? key}) : super(key: key);

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final titleEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  void dispose() {
    titleEditingController.dispose();
    descriptionEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: BlocListener<CreatePostBloc, CreatePostState>(
        listener: (context, state) {
          if (state is CreatePostSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Create Success!'),
                  Text('User id: ${state.post.userId}'),
                  Text('Post id: ${state.post.id}'),
                  Text('Title: ${state.post.title}'),
                  Text('Description: ${state.post.body}'),
                ],
              )),
            );
          }
        },
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            TextFormField(
              controller: titleEditingController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Description'),
            TextFormField(
              controller: descriptionEditingController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _onSubmitPressed(context);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmitPressed(BuildContext context) {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      context.read<CreatePostBloc>().add(CreatePostRequested(
          title: titleEditingController.text,
          body: descriptionEditingController.text));
    }
  }
}
