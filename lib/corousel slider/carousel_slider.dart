import 'package:flutter/material.dart';

class CarouselSliderScreen extends StatefulWidget {
  const CarouselSliderScreen({super.key});

  @override
  State<CarouselSliderScreen> createState() => _CarousalSliderScreenState();
}

class _CarousalSliderScreenState extends State<CarouselSliderScreen> {
  late final PageController pageController;

  final List<Map<String, dynamic>> carouselMap = [
    {
      "title": "Tea",
      "price": 10,
      "image":
          "https://images.unsplash.com/photo-1544787219-7f47ccb76574?q=80&w=1021&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Ice cream",
      "price": 10,
      "image":
          "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Pizza",
      "Price": 10,
      "image":
          "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Pasta",
      "Price": 10,
      "image":
          "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: carouselMap.length,
                itemBuilder: (_, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      return child!;
                    },
                    child: Container(
                      height: 200,
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 30,
                        bottom: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        // color: Colors.orangeAccent,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(24),
                          child: Image.network(
                            "${carouselMap.elementAt(index)["image"]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // child: Text("Irem: "),
                    ),
                  );
                },
              ),
            ),
            GridviewImage(),
          ],
        ),
      ),
    );
  }
}

class GridviewImage extends StatefulWidget {
  const GridviewImage({super.key});

  @override
  GridImageState createState() => GridImageState();
}

class GridImageState extends State<GridviewImage> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Tea",
      "price": 10,
      "image":
          "https://images.unsplash.com/photo-1544787219-7f47ccb76574?q=80&w=1021&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Ice cream",
      "price": 10,
      "image":
          "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Pizza",
      "Price": 10,
      "image":
          "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "title": "Pasta",
      "Price": 10,
      "image":
          "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: gridMap.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 250,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              // color: Colors.amberAccent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(24),
              child: Image.network(
                "${gridMap.elementAt(index)["image"]}",
                fit: BoxFit.cover,
              ),
            ),
            // child: Text("Irem: "),
          );
        },
      ),
    );
  }
}
