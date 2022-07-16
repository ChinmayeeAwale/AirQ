import 'package:flutter/material.dart';
import 'package:my_app/air.dart';
import 'package:my_app/contentpage.dart';
import 'contentbox.dart';
import 'aboutus.dart';
import 'air.dart';
import 'aboutairq.dart';
import 'recommendation.dart';
import 'test.dart';

void main() => runApp(const MyApp());

class Content {
  final String name;
  final String description;
  final String route;
  final String image;
  Content(this.name, this.description, this.route, this.image);

  static List<Content> getContents() {
    List<Content> items = <Content>[];
    items.add(Content("AirQ", "What's new ?", '/third', 'airq.jpeg'));
    items.add(Content(
        "About us",
        "Information about team-mates and upcoming projects",
        '/second',
        'About Us_.jpeg'));
    items.add(Content("Track your Room", "Look at how clean your room is",
        '/fourth', 'Track your room.jpg'));
    items.add(Content("Recommendation", "How to keep air clean in your room",
        '/fifth', 'Remedy.jpeg'));
    items.add(Content(
        "Our website",
        "here will be the website link :- Smart Air",
        '/sixth',
        'website.jpeg'));
    return items;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/second': (context) => SecondRoute(),
        '/third': (context) => const ThirdRoute(),
        '/fourth': (context) => const dashboard(),
        '/fifth': (context) => recommendation(),
        '/sixth': (context) => const test()
      },
      title: 'AirQ',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'AirQ'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Content.getContents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("AirQ HomePage"),
            leading: const Icon(Icons.air_rounded)),
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ContentBox(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContentPage(item: items[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}
