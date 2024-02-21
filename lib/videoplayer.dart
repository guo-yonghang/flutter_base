import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late Chewie playerWidget;
  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://website.hdlcdns.com/website/video/f22de68bd234445db87edb5f8e197233'),
    );

    // await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // subtitle: Subtitles([
      //   Subtitle(
      //       index: 0,
      //       start: Duration.zero,
      //       end: const Duration(seconds: 3),
      //       text: '一起嗨，海底捞'),
      // ]),
      optionsBuilder: (context, chewieOptions) async {
        return showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListView(
                children: [
                  ListTile(
                    title: const Text('播放速度'),
                    onTap: () {
                      chewieOptions[0].onTap!();
                    },
                  ),
                  ListTile(
                    title: const Text('取消'),
                    onTap: () {},
                  ),
                ],
              );
            });
      },
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Chewie(controller: chewieController),
        ),
      ),
    );
  }
}
