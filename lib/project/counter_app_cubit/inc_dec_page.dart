import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class IncrementDecmentPage extends StatelessWidget {
  const IncrementDecmentPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
    );
  }
}
