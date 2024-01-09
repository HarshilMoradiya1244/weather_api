import 'package:flutter/cupertino.dart';

class WeatherModel with ChangeNotifier {
   int? timezone, id, cod, visibility, dt;
   String? name, base;

  CoordModel? coordModel;
  MainModel? mainModel;
  WindModel? windModel;
  CloudModel? cloudModel;
  SystemModel? systemModel;
  List<WeathersModel> weatherList = [];

  WeatherModel({
     this.timezone,
     this.id,
     this.cod,
     this.visibility,
     this.dt,
     this.name,
     this.base,
     this.coordModel,
     this.mainModel,
     this.windModel,
     this.cloudModel,
     this.systemModel,
     required this.weatherList,
  });

  factory WeatherModel.mapToModel(Map m1) {
    List weather = m1['weather'];

    return WeatherModel(
      timezone: m1['timezone'],
      id: m1['id'],
      cod: m1['cod'],
      visibility: m1['visibility'],
      dt: m1['dt'],
      name: m1['name'],
      base: m1['base'],
      coordModel: CoordModel.mapToModel(
        m1['coord'],
      ),
      mainModel: MainModel.mapToModel(
        m1['main'],
      ),
      windModel: WindModel.mapToModel(
        m1['wind'],
      ),
      cloudModel: CloudModel.mapToModel(
        m1['clouds'],
      ),
      systemModel: SystemModel.mapToModel(
        m1['sys'],
      ),
      weatherList: weather.map((e) => WeathersModel.mapToModel(e)).toList(),
    );
  }
}

class CoordModel {
   double? lon, lat;

  CoordModel({ this.lon,  this.lat});

  factory CoordModel.mapToModel(Map m1) {
    return CoordModel(lat: m1['lat'], lon: m1['lon']);
  }
}

class MainModel {
      int? pressure, humidity;
      double? temp, feels_like, temp_min, temp_max;

  MainModel(
      { this.temp,
       this.feels_like,
       this.temp_min,
       this.temp_max,
       this.pressure,
       this.humidity});

  factory MainModel.mapToModel(Map m1) {
    return MainModel(
        temp: m1['temp'],
        feels_like: m1['feels_like'],
        temp_min: m1['temp_min'],
        temp_max: m1['temp_max'],
        pressure: m1['pressure'],
        humidity: m1['humidity']);
  }
}

class WindModel {
   int?  deg;
   double? speed;

  WindModel({ this.speed,  this.deg});

  factory WindModel.mapToModel(Map m1) {
    return WindModel(speed: m1['speed'], deg: m1['deg']);
  }
}

class CloudModel {
   int? all;

  CloudModel({ this.all});

  factory CloudModel.mapToModel(Map m1) {
    return CloudModel(all: m1['speed']);
  }
}

class SystemModel {
   int? type, id, sunrise, sunset;
   String? country;

  SystemModel(
      { this.type,
       this.id,
       this.sunrise,
       this.sunset,
       this.country});

  factory SystemModel.mapToModel(Map m1) {
    return SystemModel(
        type: m1['temp'],
        id: m1['feels_like'],
        sunrise: m1['temp_min'],
        sunset: m1['temp_max'],
        country: m1['pressure']);
  }
}

class WeathersModel {
   int? id;
   String? main, description, icon;

  WeathersModel(
      { this.id,
       this.main,
       this.description,
       this.icon});

  factory WeathersModel.mapToModel(Map m1) {
    return WeathersModel(
        id: m1['id'],
        main: m1['main'],
        description: m1['description'],
        icon: m1['icon']);
  }
}
