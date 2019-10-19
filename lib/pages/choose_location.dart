import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    String username = await Future.delayed(Duration(seconds: 2), (){
      return "John";
    });

    String bio = await Future.delayed(Duration(seconds: 2), (){
      return "Vegan, musician and egg collector";
    });

    print("$username, $bio");

  }

  @override
  void initState() {
    super.initState();
    getData();
    print("I am not waiting for getData()");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Choose Location"),
        elevation: 0,
      ),
      body: Text("Choose Location"),
    );
  }
}