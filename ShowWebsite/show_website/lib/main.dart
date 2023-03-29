import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Avsa.H\'s Website"),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).accentColor,
          child: ButtonBar(),
        ),
      ),
    );
  }


  
}
