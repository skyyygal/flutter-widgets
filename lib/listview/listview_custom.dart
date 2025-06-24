import 'package:flutter/material.dart';

class ListviewCustomScreen extends StatelessWidget {
  const ListviewCustomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Understanding List view custom widget")),
      body: ListView.custom(
        /*   childrenDelegate: SliverChildListDelegate([
          buildListChild(1),
          buildListChild(2),
          buildListChild(3),
        ]), */
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return buildListChild(index);
        }),
      ),
    );
  }
}

Widget buildListChild(int index) {
  return Container(
    color: Colors.cyanAccent,
    height: 150.0,
    alignment: Alignment.centerRight,
    child: ListTile(title: Text("item $index")),
  );
}
