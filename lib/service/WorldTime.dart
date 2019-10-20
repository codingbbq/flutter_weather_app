import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String url;
  String location;
  String flag;
  String time;
  bool isDayTime; // True or false based on whether it is day or night

  WorldTime({
    this.location,
    this.url,
    this.flag
  });

  // This method will get the current time from the world time api  
  Future<void> getTime() async {

    try{

      Response response = await get("http://worldtimeapi.org/api/timezone/$url");

      // Convert the return string json to a map which dart can understand
      Map data = jsonDecode(response.body);

      // From the converted data, we can extract the datetime and UTC offset
      String datetime = data['datetime'];
      List<String> offset = data['utc_offset'].split(":");

      String offsetHours = offset.first.substring(1,3);
      String offsetMinutes = offset.last;

      // Convert the datetime which was of type string to a datetime type
      DateTime now = DateTime.parse(datetime);


      // Add the UTC offset to the returned datetime
      now = now.add(Duration(
        hours: int.parse(offsetHours),
        minutes: int.parse(offsetMinutes)
      ));

      isDayTime = (now.hour > 6 && now.hour < 19) ? true : false;

      time = DateFormat.jm().format(now);

    } catch(error){

      print("Caught error $error");
      time = "Could not load data";

    }

  }


}