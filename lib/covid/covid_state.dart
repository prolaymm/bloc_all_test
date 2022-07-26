import 'package:equatable/equatable.dart';

import '../data/vos/covid_model.dart';

abstract class CovidState extends Equatable {
  const CovidState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CovidInitialState extends CovidState {}

class CovidLoadingState extends CovidState {}

class CovidLoadedState extends CovidState {
  final CovidModel covidModel;

  const CovidLoadedState(this.covidModel);
}

class CovidErrorState extends CovidState {
  final String? errorMessage;

  const CovidErrorState(this.errorMessage);
}
