import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_api/screen/home/model/home_model.dart';

class ApiHelper {
  Future<WeatherModel?> verseApi({var lat , var lon}) async {
    String apiLink = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=7acbea082f63fc71dc8b5fc9359ad809";

    var response = await http.get(Uri.parse(apiLink),);

    if (response.statusCode == 200) {
      var jsontostring = jsonDecode(utf8.decode(response.bodyBytes));
      WeatherModel data = WeatherModel.mapToModel(jsontostring);
      return data;
    }
    return null;
  }
}
