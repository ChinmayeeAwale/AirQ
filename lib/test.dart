// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: camel_case_types
class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<test> {
  final textcontroller = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  void addData(String data) {
    databaseRef.push().set({'name': data, 'comment': 'A good season'});
  }

//Mqo3Nmo7t5fbL9TzeXk
  void printFirebase() {
    databaseRef.child('AQ Index in PPM').once().then((DataSnapshot snapshot) {
      // ignore: avoid_print
      print('Data : ${snapshot.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    printFirebase();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Demo"),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Container(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 250.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: textcontroller,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                            color: Colors.pinkAccent,
                            child: const Text("Save to Database"),
                            onPressed: () {
                              addData(textcontroller.text);
                              //call method flutter upload
                            })),
                  ],
                ),
              );
            }
          }),
    );
  }
}
