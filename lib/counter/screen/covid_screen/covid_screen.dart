import 'package:bloc_test/covid/covid_bloc.dart';
import 'package:bloc_test/covid/covid_event.dart';
import 'package:bloc_test/covid/covid_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidScreen extends StatelessWidget {
  const CovidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsBloc = BlocProvider.of<CovidBloc>(context);
    newsBloc.add(GetCovidListEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid Bloc Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
          if (state is CovidInitialState) {
            debugPrint("initial State");
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CovidLoadingState) {
            debugPrint("loading State");
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CovidLoadedState) {
            return ListView.builder(
                itemCount: state.covidModel.countries!.length,
                itemBuilder: (_, index) {
                  return Card(
                      elevation: 4,
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(state.covidModel.countries![index].country.toString()),
                        Text(state.covidModel.countries![index].totalDeaths.toString())
                      ],
                    ),
                  ));
                });
          } else if (state is CovidErrorState) {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          } else {
            return const Center(
              child: Text("Developer Don't Know the Situation"),
            );
          }
        }),
      ),
    );
  }
}
