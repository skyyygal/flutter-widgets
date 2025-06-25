import 'package:flutter/material.dart';

class GridviewCustomScreen extends StatelessWidget {
  const GridviewCustomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gridview custom")),
      body: Column(
        children: [
          // GridView.custom(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //   ),
          //   childrenDelegate: SliverChildListDelegate([
          //     _buildGridElement(1),
          //     _buildGridElement(2),
          //   ]),
          // ),
          // SizedBox(height: 20),
          Expanded(
            child: GridView.custom(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              childrenDelegate: SliverChildBuilderDelegate(childCount: 10, (
                context,
                index,
              ) {
                return _buildGridElement(index);
              }),
            ),
          ),
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
