import 'package:flutter/material.dart';
import 'package:weather_api/screen/home/model/home_model.dart';
import '../../../utils/api_helper.dart';

class HomeProvider with ChangeNotifier{

  WeatherModel? weatherModel;
  var lat = 21.1702;
  var lon = 72.8311;

  Future<void> getData() async {
    ApiHelper apiHelper = ApiHelper();
    WeatherModel? user = await apiHelper.verseApi(lat:lat,lon:lon);
    weatherModel = user;
    notifyListeners();
  }

  void changeLocation(var latitude , var longitude){
    lat = latitude;
    lat = longitude;
    notifyListeners();
  }
}