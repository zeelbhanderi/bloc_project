import 'package:bloc_project/home_page.dart';
import 'package:bloc_project/project/counter_app_cubit/bloc/counter_bloc.dart';
import 'package:bloc_project/project/todo_app/cubit/todo_cubit.dart';
import 'package:bloc_project/project/todo_app/todo_cubit_list.dart';
import 'package:bloc_project/project/todo_app_bloc/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'project/counter_app_cubit/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoCubit(),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        )
      ],
      child: MaterialApp(
        title: 'BLOC Project',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'BLOC Project'),
      ),
    );
  }
}
