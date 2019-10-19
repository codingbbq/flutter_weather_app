import 'package:flutter/material.dart';

import 'package:flutter_world_time/service/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   String time = "Loading";

  void setUpWorldTime() async {
    WorldTime worldtime = WorldTime(
      location: "Berlin",
      flag: "germany.png",
      url: "Europe/Berlin"
    );

    await worldtime.getTime();

    setState(() {
      time = worldtime.time; 
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(time),
            )
          ],
        ),
      ),
    );
  }
}