import 'package:bloc_test/counter/bloc/counter_bloc.dart';
import 'package:bloc_test/counter/bloc/counter_event.dart';
import 'package:bloc_test/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_state.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Cubit Counter')),

      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>(

           builder :(_,count)=>  Text(count.counterValue.toString())

        ),
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () =>BlocProvider.of<CounterBloc>(context).add(IncrementEvent()),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => BlocProvider.of<CounterBloc>(context).add(DecrementEvent()),
          ),
        ],
      ),

    );
  }
}
