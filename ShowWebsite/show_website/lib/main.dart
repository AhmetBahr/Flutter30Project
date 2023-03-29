import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Avsa.H\'s Website"),
        ),
        body: WebView(
          initialUrl: "https://github.com/AhmetBahr",
          onWebViewCreated: (controller) => _controller.complete(controller),
        ),

        bottomNavigationBar: Container(
          color: Colors.red.shade400,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right:  20), 
            child: ButtonBar(
              children: [
                navigationButton(Icons.chevron_left, (controller) => _goBack(controller)),
                navigationButton(Icons.chevron_right, (controller) => _goForward(controller)),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget navigationButton(IconData icon,Function(WebViewController) onPressed){
    return FutureBuilder(
      future: _controller.future,
      builder: (context, AsyncSnapshot<WebViewController> snapshot){
        if(snapshot.hasData){

        return IconButton(
        onPressed: () => onPressed(snapshot.data),
       icon: Icon(
        icon,
        color:Colors.white
        ),
       );
      }
      else{
        return Container();
      }
    }
  );
}



    void _goBack(WebViewController controller) async {
    final canGoBack = await controller.canGoBack();

    if (canGoBack) {
      controller.goBack();
    }
  }

  void _goForward(WebViewController controller) async {
    final canGoForward = await controller.canGoForward();

    if (canGoForward) {
      controller.goForward();
    }
  }

}




