import 'package:flutter/material.dart';
import 'package:understanding_widgets/Hero%20Animation/hero_animation_screen.dart';

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
      home: HeroAnimationScreen(),
    );
  }
}
