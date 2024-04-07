import 'package:bloc_project/project/todo_app/model/todo_model.dart';
import 'package:bloc_project/project/todo_app_bloc/add_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';

class TodoLisBloc extends StatelessWidget {
  const TodoLisBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TODO App Bloc'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                TodoModel todo = todos[index];
                return ListTile(
                  title: Text(todos[index].title),
                  subtitle: Text(todos[index].createdAt.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTodoScreen(
                                    todo: todo,
                                  ),
                                ));
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoBloc>().add(DeleteTodo(todo));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is TodoInitial) {
            return const Text('todo list are empty ');
          } else {
            return const Text('Error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTodoScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
