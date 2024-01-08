import 'package:flutter/material.dart';
import 'package:weather_api/screen/home/model/home_model.dart';
import '../../../utils/api_helper.dart';

class HomeProvider with ChangeNotifier{

  WeatherModel? weatherModel;

  Future<void> getData() async {
    ApiHelper apiHelper = ApiHelper();
    WeatherModel? user = await apiHelper.verseApi();
    weatherModel = user;
    notifyListeners();
  }
}