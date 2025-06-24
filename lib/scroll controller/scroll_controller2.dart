import 'package:flutter/material.dart';

class ScrollControllerScreen2 extends StatefulWidget {
  const ScrollControllerScreen2({super.key});
  // helps move between elements of a list
  // If the list reached the min or max scroll ✔️

  @override
  State<ScrollControllerScreen2> createState() =>
      _ScrollControllerScreen2State();
}

class _ScrollControllerScreen2State extends State<ScrollControllerScreen2> {
  final ScrollController _controller = ScrollController();
  String text = "Initial";
  @override
  void initState() {
    super.initState();
    _controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    if (_controller.position.atEdge) {
      bool isTopReached = _controller.offset <= 0;
      isTopReached
          ? setState(() => text = "Top Reached")
          : setState(() => text = "Bottom Reached.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scrollcontroller")),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              controller: _controller,
              itemBuilder: (context, index) {
                return buildListChild(index);
              },
            ),
          ),
        ],
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
  return Card(
    color: Colors.cyanAccent,
    // height: 150.0,
    // alignment: Alignment.centerRight,
    child: SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("item $index"),
      ),
    ),
  );
}
