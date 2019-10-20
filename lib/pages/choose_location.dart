import 'package:flutter/material.dart';
import 'package:flutter_world_time/service/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: "Kolkata", url: "Asia/Kolkata", flag: "kolkata.png"),
    WorldTime(location: "Salta", url: "America/Argentina/Salta", flag: "salta.png")
  ];

  void updateTime(index) async {
    WorldTime worldTimeLocalInstance = locations[index];
    await worldTimeLocalInstance.getTime();
    Navigator.pop(context, {
      'location' : worldTimeLocalInstance.location,
      'time' : worldTimeLocalInstance.time,
      'flag' : worldTimeLocalInstance.flag,
      'isDayTime' : worldTimeLocalInstance.isDayTime
    });
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
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          );
        } // itemBuilder
      ),
    );
  }
}