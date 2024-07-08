import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_sec_test/Constants/AppURLs.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  // @override
  // void initState() {
  //   super.initState();
  //   _videoPlayerController =
  //       VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
  //         ..initialize().then((_) {
  //           setState(() {});
  //         });
  //   _chewieController = ChewieController(
  //     videoPlayerController: _videoPlayerController,
  //     autoPlay: true,
  //     looping: true,
  //   );
  // }

  // @override
  // void dispose() {
  //   _videoPlayerController.dispose();
  //   _chewieController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(AppUrl.profile))),
    );
  }
}
