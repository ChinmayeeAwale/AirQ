import 'package:flutter/material.dart';
import 'main.dart';
import 'rating.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({Key? key, required this.item}) : super(key: key);
  final Content item;

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
                            Text(item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(item.description),
                            const RatingBox(),
                          ],
                        )))
              ]),
        ));
  }
}
