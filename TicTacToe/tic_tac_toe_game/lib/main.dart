import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/tile_state.dart';

import 'board_tile.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  var _boardState = List.filled(9, TileState);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Stack(children: [Image.asset("images/board.png"), _borderTiles()]),
        ),
      )
    );

  }
  
Widget _borderTiles(){
  return Builder(builder: (context){
    final boardDismension = MediaQuery.of(context).size.width;
    final tileDimension = boardDismension / 3; 

    return Container(
      width:  boardDismension,
      height: boardDismension,
     // color: Colors.redAccent,
      child: Column(
        children: [
          Row(
            children: [
              BoardTile(dimension: tileDimension,),
              BoardTile(dimension: tileDimension,),
              BoardTile(dimension: tileDimension,),
            ],
          ),
          Row(
            children: [
              BoardTile(dimension: tileDimension,),
              BoardTile(dimension: tileDimension,),
              BoardTile(dimension: tileDimension,),
            ],
          ),
          Row(
            children: [
              BoardTile(dimension: tileDimension,),
              BoardTile(dimension: tileDimension,),
              BoardTile(dimension: tileDimension,),
            ],
          ),
        ],
      ) ,

    );


  });
}

}