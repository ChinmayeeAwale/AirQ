import 'package:flutter/material.dart';
import 'main.dart';
import 'rating.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Content item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(2),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/images/" + item.image),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(item.description),
                            const RatingBox(),
                            if (item.route != "/sixth")
                              // ignore: deprecated_member_use
                              RaisedButton(
                                child: const Text('Know More'),
                                onPressed: () {
                                  Navigator.pushNamed(context, item.route);
                                },
                              ),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}
