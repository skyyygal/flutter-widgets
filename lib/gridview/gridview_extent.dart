import 'package:flutter/material.dart';

class GridviewExtentScreen extends StatelessWidget {
  const GridviewExtentScreen({super.key});

  //When you have fixed amount of data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridviewCount widget")),
      body: GridView.extent(maxCrossAxisExtent: 2),
    );
  }
}

Widget _buildGridElement(int index) {
  return Container(
    color: Colors.cyanAccent,
    alignment: Alignment.center,
    // child: TextField(),
    child: Text(
      "Item $index",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
    ),
  );
}
