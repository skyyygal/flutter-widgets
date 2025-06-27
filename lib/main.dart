import 'package:flutter/material.dart';
import 'package:understanding_widgets/custom%20scroll%20view/custum_scrollview_screen.dart';

void main() {
  runApp(
    // const ProviderScope(child:
    MyApp(),
    // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CustomScrollViewScreen(),
    );
  }
}
