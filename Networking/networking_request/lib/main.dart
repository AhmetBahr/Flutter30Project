import 'package:flutter/material.dart';
import 'package:networking_request/data_service.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataService();
  late String _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(
        child: Builder(builder: (_) {
          if (_response != null) {
            return Text(_response);
          } else {
            return ElevatedButton(
              child: Text('Make Request'),
              onPressed: _makeRequest,
            );
          }
        }),
      )),
    );
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestToApi();
    setState(() => _response = response);
  }
}