import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/todo_cubit.dart';
import 'model/todo_model.dart';

class AddTodoCubit extends StatefulWidget {
  const AddTodoCubit({super.key});

  @override
  State<AddTodoCubit> createState() => _AddTodoCubitState();
}

class _AddTodoCubitState extends State<AddTodoCubit> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add TODO Cubit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_titleController.text.trim().isNotEmpty) {
                    context.read<TodoCubit>().addTodo(TodoModel(
                        id: DateTime.now().microsecond,
                        title: _titleController.text,
                        createdAt: DateTime.now()));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add')),
          ],
        ),
      ),
    );
  }
}
