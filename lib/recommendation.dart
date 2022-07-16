// ignore: duplicate_ignore
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
//import 'air.dart';

//import 'air.dart';
class Information {
  final String Air_Range;
  final String Quality;
  final String Remedy;
  Information(this.Air_Range, this.Quality, this.Remedy);

  static List<Information> getInformations() {
    List<Information> items = <Information>[];
    items.add(Information(
        "0-50",
        "Air quality is satisfactory, and air pollution poses little or no risk.",
        'It is quite good quality air. you can rest assured'));
    items.add(Information(
      "50-100",
      "Air quality is acceptable. However, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.",
      'Try opening up the windows and turning on the fan for better ventilation of air',
    ));
    items.add(Information(
      "100-150",
      "Air quality is acceptable. However, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.",
      'Try ventilating the room by making it sure it has cross ventilation, might turn on the air purifier',
    ));
    items.add(Information(
      "150-200",
      "Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.",
      'Keep your Air Purifier on and for future better air try keeping house plants ',
    ));
    items.add(Information(
      "200-above",
      "Health alert: The risk of health effects is increased for everyone.",
      'Leave your room, It is Dangerous !!',
    ));
    return items;
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({Key? key, required this.item}) : super(key: key);
  final Information item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.cyan[100],
                            border: Border.all(
                              color: Colors.cyan,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(item.Air_Range,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(item.Quality),
                            Text(item.Remedy)
                          ],
                        )))
              ]),
        ));
  }
}

class recommendation extends StatelessWidget {
  recommendation({Key? key}) : super(key: key);
  final items = Information.getInformations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommendation for air"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: InfoBox(
                item: items[index],
              ),
            );
          }),
    );
  }
}
