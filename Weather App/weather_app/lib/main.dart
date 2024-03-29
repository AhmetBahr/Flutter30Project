import 'package:flutter/material.dart';
import 'package:weather_app/models.dart';

import 'data_service.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  final _cityTextController = TextEditingController();
  final _dataService = DataService();

   WeatherResponse _response;

    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              if(_response != null)
                Column(
                  children: [
                  Image.network(_response.iconUrl),
                  Text(
                   "${_response.tempInfo.temperature}",
                    style: TextStyle(fontSize: 40),
                  ),
                  ],
                ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child:  SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityTextController,
                  decoration: InputDecoration(labelText: "City"),
                  textAlign: TextAlign.center,
                ) 
              ),
            ),
            ElevatedButton(
              onPressed: _serch,
              child: Text("Search") 
             )
          ],  
        )
      ),
    ));

  }
  
  void _serch() async{
    final response = await _dataService.getWeather(_cityTextController.text);

    //  print(response.cityName);
    //  print(response.tempInfo.temperature);
    //  print(response.weatherInfo.description); 

    setState(() => _response = response);

  }
}