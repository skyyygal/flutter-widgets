import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatelessWidget {
  const ListviewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Understanding the Listview builder.")),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return buildListChild(index + 1);
        },
      ),
    );
  }
}

Widget buildListChild(int item) {
  return Container(
    color: Colors.cyanAccent,
    height: 150.0,
    alignment: Alignment.centerRight,
    child: ListTile(title: Text("item $item")),
  );
}
