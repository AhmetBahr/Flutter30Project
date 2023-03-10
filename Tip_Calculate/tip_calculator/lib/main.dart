import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final controller = TextEditingController();
  
  List<bool> _selection = [true,false,false];

  String tip; 

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
    return MaterialApp(home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          if(tip != null)
          Padding(padding: EdgeInsets.all(20),
          child:  Text(tip,style: TextStyle(fontSize: 30),),),  
          Text('Total Amount'),
           SizedBox(
            width: 70,
             child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: '\$100.00'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ToggleButtons(children: [Text('10%'),Text('15%'),Text('20%')],
               isSelected: _selection,  
               onPressed: updateSelectino),
            ),
            ElevatedButton(
              onPressed: calculateTip,
              style: flatButtonStyle,
              child: Text('Calculate Tip'),
          ),
            ],
        ),
      ),
    )
    );
  }

  void updateSelectino(int selectionIndex){
    setState(() {
      for(int i=0;i< _selection.length;i++){
      _selection[i] = selectionIndex == i;
    }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = '\$$tipTotal';
    });
  }
}


