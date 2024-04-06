import 'package:bloc_project/project/counter_app_cubit/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit.dart';

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
        child: BlocBuilder<CounterCubit, int>(
          bloc: counterCube,
          builder: (context, state) {
            return Text('Number $state');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IncrementDecmentPage(),
              ));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
