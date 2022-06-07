import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/create_todo/create_todo_bloc.dart';

class CreateTodoScreen extends StatelessWidget {
  const CreateTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTodoBloc>(
      create: (context) => CreateTodoBloc(),
      child: const CreateTodoWidget(),
    );
  }
}

class CreateTodoWidget extends StatefulWidget {
  const CreateTodoWidget({Key? key}) : super(key: key);

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final titleEditingController = TextEditingController();

  @override
  void dispose() {
    titleEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: BlocListener<CreateTodoBloc, CreateTodoState>(
        listener: (context, state) {
          if (state is CreateTodoSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Create Success!'),
                  Text('User id: ${state.todo.userId}'),
                  Text('Post id: ${state.todo.id}'),
                  Text('Title: ${state.todo.title}'),
                  Text('Completed: ${state.todo.completed}'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                _onSubmitPressed(context);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmitPressed(BuildContext context) {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // add event to the bloc to request to create a todo
      context
          .read<CreateTodoBloc>()
          .add(CreateTodoRequested(title: titleEditingController.text));
    }
  }
}
