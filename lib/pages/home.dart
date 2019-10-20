import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // Condition to output day or night image
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$bgImage'),
                fit: BoxFit.cover
                )
              ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');

                  // When you hit the back button on the appBar, result will be null
                  if(result != null){
                    setState(() {
                    data = {
                      'time' : result['time'],
                      'location': result['location'],
                      'isDayTime' : result['isDayTime'],
                      'flag' : result['flag']
                    };
                    });
                  }
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Locattion"),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 4.0, color: Colors.grey[600]),
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                            color: Colors.black26,
                          ),
                        ]),
                    child: Text(
                      data['location'],
                      style: TextStyle(fontSize: 20.0, letterSpacing: 2.0),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
