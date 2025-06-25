import 'package:flutter/material.dart';

class GridviewScreen extends StatelessWidget {
  const GridviewScreen({super.key});

  //When you have fixed amount of data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gridview")),
      body: GridView(
        // addAutomaticKeepAlives: false,
        // addRepaintBoundaries: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1, //W/H = ?
          // mainAxisExtent: 100,
        ),
        children: [
          _buildGridElement(1),
          _buildGridElement(2),
          _buildGridElement(3),
          _buildGridElement(4),
          _buildGridElement(5),
          _buildGridElement(6),
          _buildGridElement(7),
          _buildGridElement(9),
          _buildGridElement(10),
          _buildGridElement(11),
          _buildGridElement(12),
        ],
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
