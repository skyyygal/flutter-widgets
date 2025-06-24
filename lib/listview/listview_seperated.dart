import 'package:flutter/material.dart';

class ListviewSeperatedScreen extends StatelessWidget {
  const ListviewSeperatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Understanding the Listview builder.")),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return buildListChild(index + 1);
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.white, thickness: 5.0, height: 5.0);
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
