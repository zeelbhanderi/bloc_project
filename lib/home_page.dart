import 'package:flutter/material.dart';

import 'project/counter_app_cubit/cubit/counter_app_cubit.dart';

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

List<Project> projectList = [
  Project('Counter App', 'A simple counter app using cubit', CounterAppCubit()),
];

class Project {
  final String name;
  final String description;
  final Widget projectPage;

  Project(this.name, this.description, this.projectPage);
}
