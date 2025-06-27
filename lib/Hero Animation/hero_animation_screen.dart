import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatelessWidget {
  HeroAnimationScreen({super.key});
  List<String> images = [
    "https://plus.unsplash.com/premium_photo-1676475964992-6404b8db0b53?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Zmxvd2Vyc3xlbnwwfHwwfHx8MA%3D%3D",

    "https://images.unsplash.com/photo-1460039230329-eb070fc6c77c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",

    "https://images.unsplash.com/photo-1468327768560-75b778cbb551?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",

    "https://images.unsplash.com/photo-1519378058457-4c29a0a2efac?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",

    "https://plus.unsplash.com/premium_photo-1676068243733-df1880c2aef8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1613539246066-78db6ec4ff0f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        HeroAnimationDetailScreen(
                          // index: index,
                          imageUrl: images[index],
                          tag: "flower $index",
                        ),
                  ),
                );
              },
              child: Hero(
                tag: "flowers$index",
                child: Image.network(images[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> images = [
  "https://plus.unsplash.com/premium_photo-1676475964992-6404b8db0b53?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Zmxvd2Vyc3xlbnwwfHwwfHx8MA%3D%3D",

  "https://images.unsplash.com/photo-1460039230329-eb070fc6c77c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",

  "https://images.unsplash.com/photo-1468327768560-75b778cbb551?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",

  "https://images.unsplash.com/photo-1519378058457-4c29a0a2efac?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",

  "https://plus.unsplash.com/premium_photo-1676068243733-df1880c2aef8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1613539246066-78db6ec4ff0f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGZsb3dlcnN8ZW58MHx8MHx8fDA%3D",
];

class HeroAnimationDetailScreen extends StatelessWidget {
  const HeroAnimationDetailScreen({
    super.key,
    // required this.index,
    required this.imageUrl,
    required this.tag,
  });
  // final int index;
  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flower Details"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Hero(
            tag: tag,
            // tag: "flowers $index",
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(imageUrl),
            ),
            // child: Image.network(images[index], fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
