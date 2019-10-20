import 'package:flutter/material.dart';

// Custom class to get the time
import 'package:flutter_world_time/service/WorldTime.dart';

// Loading spinner
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
    WorldTime worldtime = WorldTime(
      location: "Berlin",
      flag: "germany.png",
      url: "Europe/Berlin"
    );

    await worldtime.getTime();

    // Once we get the time, we then navigate to Home page, we pass the necessary arguments to the home page.
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location' : worldtime.location,
      'time': worldtime.time,
      'flag': worldtime.flag,
      'isDayTime': worldtime.isDayTime
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
      backgroundColor: Colors.blue[900],
      body: Container(
        child: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}