import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit.dart';

class CounterAppCubit extends StatelessWidget {
   CounterAppCubit({super.key});
final counterCube = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter App Using Cubit'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body:  Center(
          child: BlocBuilder<CounterCubit, int>(
            bloc: counterCube,
            builder: (context, state) {
              return Text('Number $state');
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterCube.increment();
              },
              heroTag: 'increment',
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterCube.decrement();
              },
              heroTag: 'decrement',
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),
            ),
          ],
        ));
  }
}
