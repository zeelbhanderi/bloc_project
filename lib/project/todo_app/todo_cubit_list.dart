import 'package:bloc_project/project/todo_app/cubit/todo_cubit.dart';
import 'package:bloc_project/project/todo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_cubit_page.dart';

class TodoCubitList extends StatelessWidget {
  TodoCubitList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO Cubit List'),
      ),
      body: BlocBuilder<TodoCubit, List<TodoModel>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].title),
                subtitle: Text(todos[index].createdAt.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTodoCubit(),
                      ));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTodoCubit(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
