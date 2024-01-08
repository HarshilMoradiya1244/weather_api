import 'package:flutter/cupertino.dart';

class WeatherModel with ChangeNotifier {
  final int timezone, id, cod, visibility, dt;
  final String name, base;

  CoordModel? coordModel;
  MainModel? mainModel;
  WindModel? windModel;
  CloudModel? cloudModel;
  SystemModel? systemModel;

  WeatherModel({required this.timezone,
    required this.id,
    required this.cod,
    required this.visibility,
    required this.dt,
    required this.name,
    required this.base,
    required this.coordModel,
    required this.mainModel,
    required this.windModel,
    required this.cloudModel,
    required this.systemModel,
  });

  factory WeatherModel.mapToModel(Map m1){
    return WeatherModel(timezone: m1['timezone'],
        id: m1['id'],
        cod: m1['cod'],
        visibility: m1['visibility'],
        dt: m1['dt'],
        name: m1['name'],
        base: m1['base'],
    coordModel: CoordModel.mapToModel(m1['coor'],),
    mainModel: MainModel.mapToModel(m1['main'],),
    windModel: WindModel.mapToModel(m1['wind'],),
    cloudModel: CloudModel.mapToModel(m1['cloud'],),
    systemModel: SystemModel.mapToModel(m1['sys'],));

  }
}

class CoordModel {
  final int lon, lat;

  CoordModel({required this.lon, required this.lat});

  factory CoordModel.mapToModel(Map m1){
    return CoordModel(lat: m1['lat'],
        lon: m1['lon']);
  }
}

class MainModel {
  final int temp, feels_like, temp_min, temp_max, pressure, humidity;

  MainModel({required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity});


  factory MainModel.mapToModel(Map m1){
    return MainModel(temp: m1['temp'],
    feels_like: m1['feels_like'],
    temp_min: m1['temp_min'],
    temp_max: m1['temp_max'],
    pressure: m1['pressure'],
    humidity: m1['humidity']);
  }
}

class WindModel {
  final int speed, deg;

  WindModel({required this.speed, required this.deg});

  factory WindModel.mapToModel(Map m1){
    return WindModel(speed: m1['speed'],
        deg: m1['deg']);
  }
}

class CloudModel {
  final int all;

  CloudModel({required this.all});

  factory CloudModel.mapToModel(Map m1){
    return CloudModel(all: m1['speed']);
  }
}

class SystemModel {

  final int type, id, sunrise, sunset;
  final String country;

  SystemModel(
      {required this.type, required this.id, required this.sunrise, required this.sunset, required this.country});

  factory SystemModel.mapToModel(Map m1){
    return SystemModel(type: m1['temp'],
        id: m1['feels_like'],
        sunrise: m1['temp_min'],
        sunset: m1['temp_max'],
        country: m1['pressure']);
  }
}




