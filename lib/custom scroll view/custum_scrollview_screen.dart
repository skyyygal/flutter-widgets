import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom scrollview"), centerTitle: true),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.indigoAccent.withOpacity(0.2),
                  ),
                  child: Center(child: Text("Custom scroll")),
                ),
              );
            }, childCount: 5),
          ),

          // Vertical column
          // horizontal row
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red.withOpacity(0.2),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Vertical column
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 8, (
              context,
              index,
            ) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.indigoAccent.withOpacity(0.2),
                  ),
                  child: Center(child: Text("Custom scroll")),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
