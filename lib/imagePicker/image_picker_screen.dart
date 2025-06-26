import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  List<File> images = [];
  // image picker
  final ImagePicker picker = ImagePicker();
  bool isPickingImage = false;

  Future<void> pickImage() async {
    print("PickIMage executed");
    if (isPickingImage) return;
    setState(() {
      isPickingImage = true;
      print("PickIMage executed $isPickingImage");
    });
    try {
      print("PickIMage try ");
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        print("PickIMage is not null ");
        setState(() {
          print("Picking image");
          images.add(File(pickedFile.path));
        });
      }
    } catch (e) {
      print(e);
      debugPrint('Image picker error: $e');
    } finally {
      if (mounted) {
        setState(() => isPickingImage = false);
      }
    }
  }

  void deleteImage(File image) {
    setState(() {
      images.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        actions: [
          IconButton(
            onPressed: () {
              pickImage();
            },
            icon: Icon(Icons.add_a_photo_sharp),
          ),
        ],
      ),
      body: images.isEmpty
          ? Center(child: Text("No Photo selected"))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: images.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  File image = images[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(21),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  print("Delete executed");
                                  print("image: $image");
                                  deleteImage(image);
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [Image.file(image, fit: BoxFit.cover)],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
