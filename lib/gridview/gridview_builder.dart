import 'package:flutter/material.dart';

class GridviewBuilderScreen extends StatelessWidget {
  const GridviewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gridview")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return _buildGridElement(index);
        },
      ),
    );
  }
}

Widget _buildGridElement(int index) {
  return Container(
    color: Colors.cyanAccent,
    alignment: Alignment.center,
    child: Text(
      "Item $index",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
    ),
  );
}
