import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About AirQ"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(children: <Widget>[
          //icon with label below it
          Container(
              padding: const EdgeInsets.all(30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(children: const <Widget>[
                      Icon(Icons.air_rounded, size: 100),
                      Text(
                          'This is a Flutter app for tracking the \n Air Quality of the room sensed from the MQ135\n sensor. Since the deteriorating quality of air in our\n surroundings, it has been a necessity to keep a\n track of what type of air we breathe in. To do so\n MQ135 sensor can be used to detect the gases and\n flutter app can be a application that can show you\n the output in a more convenient format so that the\n user can get a summary of the air quality. With\n respect to the air quality the app shall also give a\n remedy to improve the quality further.'),
                    ]),
                  ]))
        ]));
  }
}
/*  body: const Center(
          child: Text(
              "This is a Flutter app for tracking the \n Air Quality of the room sensed from the MQ135\n sensor. Since the deteriorating quality of air in our\n surroundings, it has been a necessity to keep a\n track of what type of air we breathe in. To do so\n MQ135 sensor can be used to detect the gases and\n flutter app can be a application that can show you\n the output in a more convenient format so that the\n user can get a summary of the air quality. With\n respect to the air quality the app shall also give a\n remedy to improve the quality further."
              )
            ),*/
