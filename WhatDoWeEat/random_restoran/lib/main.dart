import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp>{
  List<String> restaurants = [
    'Burger King',
    'Poppeys',
    'Pasaport Pizza',
    'Baydoner'
    'Kofteci Ramiz',
    'Tavuk Dünyasi',
    'Mr. Kumpir',
    'Usta Doner',
    'Pizza Wings',
    'Pidem',
    'Macaroni Express',
    'Labella',
    'King Pizza',
    'Aradaki Yeni Pizzaci'
  ];

  int currentIndex=5;

  final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white, //Text
  primary: Colors.purple, // Background
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('What do you want to eat?'),
          if (currentIndex != null)
            Text(
              restaurants[currentIndex],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          ElevatedButton(
            onPressed: () {
              randomIndex();
            },
            style: flatButtonStyle,
            child: Text('Pick Restaurant'),

          ),
        ],
      ))),
    );
  }

 
   void randomIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }
}
