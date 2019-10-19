import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // This method will get the current time from the world time api  
  void getTime() async {

    Response response = await get("http://worldtimeapi.org/api/timezone/Asia/Kolkata");

    // Convert the return string json to a map which dart can understand
    Map data = jsonDecode(response.body);

    // From the converted data, we can extract the datetime and UTC offset
    String datetime = data['datetime'];
    List<String> offset = data['utc_offset'].split(":");

    String offset_hours = offset.first.substring(1,3);
    String offset_minutes = offset.last;

    // Convert the datetime which was of type string to a datetime type
    DateTime now = DateTime.parse(datetime);

    // Add the UTC offset to the returned datetime
    now = now.add(Duration(
      hours: int.parse(offset_hours),
      minutes: int.parse(offset_minutes)
    ));

    print(now);

  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}