import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'circle_progress.dart';
//import 'recommendation.dart';

// ignore: camel_case_types
class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

// ignore: camel_case_types
class _dashboardState extends State<dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  //final GoogleSignIn googleSignIn = GoogleSignIn();
  final databaseReference = FirebaseDatabase.instance.reference();

  late AnimationController progressController;
  late Animation<double> airAnimation;

  @override
  void initState() {
    super.initState();
    databaseReference
        .child('AQ Index in PPM')
        .once()
        .then((DataSnapshot snapshot) {
      double air = snapshot.value;
      isLoading = true;
      _dashboardInit(air);
      //_airquality(air);
    });
  }

  _dashboardInit(double air) {
    progressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50));
    airAnimation =
        Tween<double>(begin: -10, end: air).animate(progressController)
          ..addListener(() {
            setState(() {});
          });
    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Quality in PPM'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(icon: const Icon(Icons.reorder), onPressed: () {}),
      ),
      body: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomPaint(
                      foregroundPainter:
                          circle_progress(airAnimation.value, true),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('AQ PPM'),
                              Text(
                                '${airAnimation.value.toInt()}',
                                style: const TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : const Text('Loading')
          // ignore: deprecated_member_use
          ),
    );
  }
}
