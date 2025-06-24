import 'package:flutter/material.dart';

class ScrollControllerScreen extends StatelessWidget {
  ScrollControllerScreen({super.key});
  final ScrollController _controller = ScrollController();
  //helps move between elements of a list ✔️
  // If the list reached the min or max scroll
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Understanding List view custom widget")),
      body: ListView.builder(
        itemCount: 50,
        controller: _controller,
        itemBuilder: (context, index) {
          return buildListChild(index);
        },
      ),
      floatingActionButton: buildFAB(),
    );
  }

  buildFAB() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () {
            double startPosition = 0.0;
            _controller.position.jumpTo(startPosition);
          },
          child: Icon(Icons.arrow_upward),
        ),
        FloatingActionButton(
          onPressed: () {
            double endPosition = _controller.position.maxScrollExtent;
            // _controller.position.jumpTo(endPosition);
            _controller.position.animateTo(
              endPosition,
              duration: Duration(seconds: 2),
              curve: Curves.decelerate,
            );
          },
          child: Icon(Icons.arrow_downward),
        ),
      ],
    );
  }
}

// Widget

Widget buildListChild(int index) {
  return Container(
    color: Colors.cyanAccent,
    height: 150.0,
    alignment: Alignment.centerRight,
    child: ListTile(title: Text("item $index")),
  );
}
