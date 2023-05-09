import 'package:flutter/material.dart';



class microphone extends StatefulWidget {
  @override
  State<microphone> createState() => _microphoneState();
}

class _microphoneState extends State<microphone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(

        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
