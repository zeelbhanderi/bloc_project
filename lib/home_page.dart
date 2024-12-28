import 'package:bloc_project/project/todo_app_bloc/todo_bloc_list.dart';
import 'package:flutter/material.dart';

import 'project/counter_app_cubit/counter_app_cubit.dart';
import 'project/login-ui/login_screen.dart';
import 'project/todo_app/todo_cubit_list.dart';
import 'project/weather_app/weather_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: projectList.length,
        itemBuilder: (context, index) {
          Project project = projectList[index];
          return ListTile(
            title: Text('Project ${project.name}'),
            subtitle: Text(project.description),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => project.projectPage,
                  ));
            },
          );
        },
      ),
    );
  }
}

final List<Project> projectList = [
  Project('Counter App', 'A simple counter app.', const CounterApp()),
  Project('TODO App Cubit', 'A simple todo app using cubit',  TodoCubitList()),
  Project('TODO App Bloc', 'A simple todo app using cubit',  TodoLisBloc()),
  Project('Login Bloc', 'A simple login app using bloc',  LoginScreen()),
  Project('Weather Bloc', 'A simple login app using bloc',  WeatherScreen()),
];

class Project {
  final String name;
  final String description;
  final Widget projectPage;

  Project(this.name, this.description, this.projectPage);
}
