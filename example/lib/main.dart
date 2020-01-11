import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController2 = VideoPlayerController.network(
        'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController2,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.black,
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}
