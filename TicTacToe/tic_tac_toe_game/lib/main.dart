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

  var _boardState = List.filled(9, TileState.EMPTY);

  var _currentTurn = TileState.CROSS;

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
         children: chunk(_boardState, 3).asMap().entries.map((entry) {
            final chunkIndex = entry.key;
            final tileStateChunk = entry.value;

            return Row(
              children: tileStateChunk.asMap().entries.map((innerEntry) {
                final innerIndex = innerEntry.key;
                final tileState = innerEntry.value;
                final tileIndex = (chunkIndex * 3) + innerIndex;

                return BoardTile(
                  tileState: tileState,
                  dimension: tileDimension,
                // onPressed: () => print("Tapped index $tileIndex"),
                  onPressed: () => _updateTileStateForIndex(tileIndex),
                );
              }).toList(),
            );
          }).toList()));
    });
  }

  void _updateTileStateForIndex(int selectedIndex){
    if(_boardState[selectedIndex] == TileState.EMPTY){
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
        _currentTurn =_currentTurn == TileState.CROSS ? TileState.CIRCLE: TileState.CROSS;
      });

      final winner = _findWinner();
      if(winner != null)
        print("Winner is $winner");

    }
  }

  TileState _findWinner(){
        TileState Function(int, int, int) winnerForMatch = (a, b, c) {
      if (_boardState[a] != TileState.EMPTY) {
        if ((_boardState[a] == _boardState[b]) &&
            (_boardState[b] == _boardState[c])) {
          return _boardState[a];
        }
      }
      return null;
  };

    final checks = [
        winnerForMatch(0, 1, 2),
        winnerForMatch(3, 4, 5),
        winnerForMatch(6, 7, 8),
        winnerForMatch(0, 3, 6),
        winnerForMatch(1, 4, 7),
        winnerForMatch(2, 5, 8),
        winnerForMatch(0, 4, 8),
        winnerForMatch(2, 4, 6),
      ];

      TileState winner;
      for (int i = 0; i < checks.length; i++) {
        if (checks[i] != null) {
          winner = checks[i];
          break;
        }
      }
    return winner;
  }



}
