import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreens extends StatefulWidget {
  const VideoPlayerScreens({super.key});

  @override
  State<VideoPlayerScreens> createState() => _VideoPlayerScreensState();
}

class _VideoPlayerScreensState extends State<VideoPlayerScreens> {
  VideoPlayerController? videoPlayerController;
  final ImagePicker? picker = ImagePicker();
  bool isPickedActive = false;
  bool showPlayIcon = true;

  //Method to pick ka video
  Future<void> pickVideo() async {
    setState(() {
      isPickedActive = false;
    });
    try {
      final XFile? video = await picker!.pickVideo(source: ImageSource.gallery);

      if (video != null) {
        videoPlayerController?.dispose();
        videoPlayerController = VideoPlayerController.file(File(video.path))
          ..initialize().then((_) {
            setState(() {
              videoPlayerController!.pause();
              showPlayIcon = true;
            });
          });
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setState(() {
        isPickedActive = false;
      });
    }
  }

  void togglePlayPause() {
    if (videoPlayerController != null &&
        videoPlayerController!.value.isInitialized) {
      setState(() {
        if (videoPlayerController!.value.isPlaying) {
          videoPlayerController!.play();
          showPlayIcon = false;
        } else {
          videoPlayerController!.play();
          showPlayIcon = false;
        }
      });
    }
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 700,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                  ),
                  child:
                      videoPlayerController != null &&
                          videoPlayerController!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: videoPlayerController!.value.aspectRatio,
                          child: VideoPlayer(videoPlayerController!),
                        )
                      : Center(child: Text("Pick a video")),
                ),
                if (showPlayIcon)
                  GestureDetector(
                    onTap: togglePlayPause,
                    child: const Icon(
                      Icons.play_circle_fill,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {
              pickVideo();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
            ),
            child: Text("Pick Video"),
          ),
        ],
      ),
    );
  }
}
