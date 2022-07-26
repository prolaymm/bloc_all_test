import 'package:bloc_test/covid/covid_event.dart';
import 'package:bloc_test/covid/covid_state.dart';
import 'package:bloc_test/data/repo/covid_api_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
 final CovidApiRepo _apiRepo = CovidApiRepo();

  CovidBloc() : super(CovidInitialState()) {
    on<GetCovidListEvent>((event, emit) async {
      try {
        emit(CovidLoadingState());
        debugPrint("data");
        final mList = await _apiRepo.fetchCovidApi();

        emit(CovidLoadedState(mList));

        if (mList.error != null) {
          emit(CovidErrorState(mList.error));
        }
      } catch (error) {
        emit(CovidErrorState(error.toString()));
      }
    });
  }
}
