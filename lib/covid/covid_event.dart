import 'package:equatable/equatable.dart';

abstract class CovidEvent extends Equatable {

  const CovidEvent();

  @override
  List<Object> get props => [];
}

class GetCovidListEvent extends CovidEvent {

}