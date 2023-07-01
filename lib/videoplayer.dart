import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class videoPlayer extends StatefulWidget {
  const videoPlayer({super.key});
  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  late ImagePicker imagePicker;
  File? videoFile;
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        actions: [buildPickVideo()],
      ),
      body: controller != null
          ? GestureDetector(
              onTap: () {
                if (controller!.value.isPlaying) {
                  controller!.pause();
                } else {
                  controller!.play();
                }
              },
              child: AspectRatio(
                aspectRatio: controller!.value.aspectRatio,
                child: VideoPlayer(controller!),
              ),
            )
          : Container(),
    );
  }

  Padding buildPickVideo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: () async {
            var video =
                await imagePicker.pickVideo(source: ImageSource.gallery);
            videoFile = File(video!.path);
            controller = VideoPlayerController.file(videoFile!)
              ..initialize()
              ..addListener(() {})
              ..play()
              ..setLooping(false);
            setState(() {});
          },
          icon: const Icon(Icons.add_circle)),
    );
  }
}
