import 'package:bloc_test/counter/cubit/counter_cubit.dart';
import 'package:bloc_test/counter/screen/BlocCounterScreen/bloc_counter_screen.dart';
import 'package:bloc_test/counter/screen/CubitCounterScreen/CubitCounterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/bloc/counter_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_)=> CounterBloc(),
          child: const BlocCounterScreen()),
    );
  }
}


