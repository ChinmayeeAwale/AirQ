// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Information {
  final String Name;
  final String Job;
  final String About_you;
  final String image;
  Information(this.Name, this.Job, this.About_you, this.image);

  static List<Information> getInformations() {
    List<Information> items = <Information>[];
    items.add(Information(
        "Chinmayee Awale",
        "Flutter App Developer",
        'Second Year ENTC student pursuing engineering in VIT Pune and founder of AirQ',
        "Chinmayee.jpeg"));
    items.add(Information(
        "Resham Bhattad",
        "Android App developer",
        'Second Year ENTC student pursuing engineering in VIT Pune and founder of City Air',
        "Resham.jpeg"));
    items.add(Information(
        "Tejas Badhe",
        "Web Developer",
        'Second Year ENTC student pursuing engineering in VIT Pune and founder of Smart Air',
        "Tejas.jpg"));
    items.add(Information(
        "Nayan Bari",
        "Web Developer",
        'Second Year ENTC student pursuing engineering in VIT Pune and founder of Smart Air',
        "Nayan.jpeg"));
    items.add(Information(
        "Pratham Bannore",
        "Web Developer",
        'Second Year ENTC student pursuing engineering in VIT Pune and founder of Smart Air',
        "Pratham.jpeg"));
    return items;
  }
}

class SecondRoute extends StatelessWidget {
  SecondRoute({
    Key? key,
  }) : super(key: key);

  final items = Information.getInformations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
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
                Image.asset("assets/images/" + item.image),
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
                            Text(item.Name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(item.Job),
                            Text(item.About_you)
                          ],
                        )))
              ]),
        ));
  }
}
