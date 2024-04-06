import 'package:bloc_project/project/counter_app_cubit/bloc/counter_bloc.dart';
import 'package:bloc_project/project/counter_app_cubit/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class CounterAppCubit extends StatelessWidget {
  const CounterAppCubit({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCube = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App Using Cubit'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text('Bloc Number $state');
              },
            ),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('Cubit Number $state');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IncrementDecrementPage(),
              ));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
