import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService{

  Future<WeatherResponse> getWeather(String city) async{
     // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParametres = {'q': city, 'appid' : '958ffe21b73aa0f1e8c4e56a46051eba'};

    final uri = Uri.http('api.openweathermap.org','/data/2.5/weather', queryParametres);


    final response = await http.get(uri);

    print(response.body);
    
    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);

  }
}