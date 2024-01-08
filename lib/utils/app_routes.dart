import 'package:flutter/material.dart';
import 'package:weather_api/screen/home/model/home_model.dart';
import 'package:weather_api/screen/home/view/weather_screen.dart';

Map<String,WidgetBuilder> screen_routes = {
  '/':(context) => const WeatherScreen()
};