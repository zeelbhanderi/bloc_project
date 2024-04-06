import 'package:bloc_project/project/counter_app_cubit/bloc/counter_bloc.dart';
import 'package:bloc_project/project/counter_app_cubit/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    final counterCube = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment Decrement Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Bloc'),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterIncremented());
              },
              heroTag: 'blocIncrement',
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterDecremented());
              },
              heroTag: 'blocDecrement',
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),
            ),
            const Text('Cubit'),
            FloatingActionButton(
              onPressed: () {
                counterCube.increment();
              },
              heroTag: 'cubitIncrement',
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterCube.decrement();
              },
              heroTag: 'cubitDecrement',
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),
            ),
          ],
        ),
      ),
    );
  }
}
