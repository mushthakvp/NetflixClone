import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/presentation/widgets/space.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(
          key: key,
          child: widget,
        );

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;

    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: greyColor.withOpacity(.3),
                  radius: 25,
                  child: const Icon(
                    Icons.volume_down,
                    color: blackColor,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageUppendUrl$posterPath'),
                      backgroundColor: greyColor.withOpacity(.3),
                      radius: 30,
                    ),
                    space(),
                    ValueListenableBuilder(
                      valueListenable: likedVideosNotifier,
                      builder: (BuildContext context, Set<int> likedValue, _) {
                        final _index = index;
                        if (likedValue.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosNotifier.value.remove(_index);
                              likedVideosNotifier.notifyListeners();
                            },
                            child: const VideoActions(
                              icon: Icons.favorite,
                              name: 'Liked',
                              color: redColor,
                              size: 35,
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosNotifier.value.add(_index);
                            likedVideosNotifier.notifyListeners();
                          },
                          child: const VideoActions(
                              icon: Icons.emoji_emotions, name: 'LOL'),
                        );
                      },
                    ),
                    const VideoActions(icon: Icons.add, name: 'My List'),
                    GestureDetector(
                        onTap: () {
                          Share.share(
                              'Check out Github repo https://github.com/MushthakVP');
                        },
                        child: const VideoActions(
                            icon: Icons.share, name: 'Share')),
                    const VideoActions(icon: Icons.play_arrow, name: 'Pause'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final double size;
  final String name;
  final Color color;
  const VideoActions({
    Key? key,
    required this.icon,
    required this.name,
    this.color = whiteColor,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: size,
          ),
          space(he: 5),
          Text(
            name,
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            ),
    );
  }
}
