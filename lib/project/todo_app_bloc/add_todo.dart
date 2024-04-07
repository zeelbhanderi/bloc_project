import 'package:bloc_project/project/todo_app/model/todo_model.dart';
import 'package:bloc_project/project/todo_app_bloc/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  final TodoModel? todo;

  const AddTodoScreen({super.key, this.todo});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  bool isEditTodo = false;
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todo != null) {
      isEditTodo = true;
      _titleController.text = widget.todo?.title ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Todo Bloc'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (isEditTodo) {
                      context.read<TodoBloc>().add(EditTodo(TodoModel(
                          id: widget.todo!.id,
                          title: _titleController.text.trim(),
                          createdAt: DateTime.now())));
                    } else {
                      context.read<TodoBloc>().add(AddTodo(TodoModel(
                          id: DateTime.now().microsecond,
                          title: _titleController.text.trim(),
                          createdAt: DateTime.now())));
                    }
                    Navigator.pop(context);
                  },
                  child: Text(isEditTodo ? 'Edit TODO' : 'Add TODO'))
            ],
          ),
        ));
  }
}
