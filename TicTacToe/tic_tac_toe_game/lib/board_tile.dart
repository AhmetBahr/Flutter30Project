import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/tile_state.dart';

class BoardTile extends StatelessWidget{
  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;
  
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  BoardTile({Key key , this.dimension, this.onPressed,this.tileState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
                width: dimension,
                height: dimension,
             
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: onPressed,
                  child:_widgetForTileState(),
                )
              ); 

  }

  Widget _widgetForTileState(){
    Widget widget;

    switch(tileState){
      case TileState.EMPTY: widget = Container();
        break;

      case TileState.CROSS: widget = Image.asset("images/x.png");
        break;

      case TileState.CIRCLE: widget = Image.asset("images/o.png");
        break;

    }
      return widget;

  }

}