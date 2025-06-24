import 'dart:math';

import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  const ListviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        cacheExtent: 150,

        // addAutomaticKeepAlives: false,
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemExtent: 100,
        children: [
          buildListChild(1),
          buildListChild(2),
          buildListChild(3),
          buildListChild(4),
          buildListChild(5),
          buildListChild(6),
          buildListChild(7),
          buildListChild(8),
          buildListChild(9),
          buildListChild(10),
          buildListChild(11),
          buildListChild(12),
          buildListChild(13),
          buildListChild(14),
          buildListChild(15),
        ],
      ),
    );
  }
}

Widget buildListChild(int item) {
  return Container(
    color: getRandomColor(),
    height: 150.0,
    alignment: Alignment.centerRight,
    child: ListTile(title: Text("item $item")),
  );
}

Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
