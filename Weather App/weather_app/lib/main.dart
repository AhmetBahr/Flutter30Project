import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  final _cityTextController = TextEditingController();
 // final _dataService = DataService();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
  
  void _serch(){

  }
}