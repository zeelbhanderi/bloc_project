import 'package:bloc_project/home_page.dart';
import 'package:bloc_project/project/counter_app_cubit/bloc/counter_bloc.dart';
import 'package:bloc_project/project/login-ui/bloc/auth_bloc.dart';
import 'package:bloc_project/project/todo_app/cubit/todo_cubit.dart';
import 'package:bloc_project/project/todo_app_bloc/bloc/todo_bloc.dart';
import 'package:bloc_project/project/weather_app/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'project/counter_app_cubit/cubit/counter_cubit.dart';
import 'project/login-ui/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
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
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'BLOC Project',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'BLOC Project'),
      ),
    );
  }
}
