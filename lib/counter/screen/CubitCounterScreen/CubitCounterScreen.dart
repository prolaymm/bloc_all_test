import 'package:bloc_test/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Cubit Counter')),

      body: Center(
        child: BlocBuilder<CounterCubit,int>(
            builder :(_,count)=>  Text(count.toString())
        ),
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () =>BlocProvider.of<CounterCubit>(context).increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(),
          ),
        ],
      ),

    );
  }
}
