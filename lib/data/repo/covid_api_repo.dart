import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../vos/covid_model.dart';

class CovidApiRepo {
  final Dio _dio = Dio();

  final String _url = 'https://api.covid19api.com/summary';

  Future<CovidModel> fetchCovidApi() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occur: $error stackTrace: $stacktrace");
      return CovidModel.withError(errorMessage: error.toString());
    }
  }
}
