import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:better_player/better_player.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../flutter_story.dart';
import 'loading_indicator.dart';
import 'story_progress_bar.dart';

const defaultStoryDuration = Duration(seconds: 5);
// const rewindDuration = Duration(seconds: 2);

// enum StoryEvents {
//   leftTap,
//   rightTap,
//   hold,
//   onPlay,
//   onLoad,
// }

class StoryView extends StatefulWidget {
  const StoryView({Key? key, required this.storyContents}) : super(key: key);

  final List<Story> storyContents;

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView>
    with SingleTickerProviderStateMixin {
  late int indexToPlay;

  late List<Widget> storyWidgets;

  late AnimationController animationController;

  late bool showProgressBar;

  @override
  void initState() {
    super.initState();
    indexToPlay = 0;
    showProgressBar = true;

    storyWidgets = widget.storyContents.map((e) => getStoryWidgets(e)).toList();

    animationController = AnimationController(vsync: this);

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        _goToNext();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _rewind() async {
    // reset progressbar
    animationController.reset();
    // animationController.forward();
  }

  _goToPrevious({BetterPlayerController? controller}) {
    // if (controller != null) {
    //   // story is video,
    //   if ((controller.videoPlayerController?.value.position ??
    //           const Duration(seconds: 0)) >
    //       rewindDuration) {
    //     // story is video & duration is more than a sec, rewind
    //     controller.seekTo(const Duration(seconds: 0)).then((_) => _rewind());
    //   } else if (indexToPlay > 0) {
    //     // story is video & duration is less than a second, go to previous
    //     setState(() {
    //       animationController.reset();
    //       animationController.stop();
    //       indexToPlay = indexToPlay - 1;
    //     });
    //   }
    // } else {
    //   // story is not video
    //   if ((animationController.lastElapsedDuration ??
    //           const Duration(seconds: 0)) >
    //       rewindDuration) {
    //     // story is not video & duration is more than a sec, rewind
    //     _rewind();
    //   } else if (indexToPlay > 0) {
    //     // story is video & duration is less than a second, go to previous
    //     setState(() {
    //       animationController.reset();
    //       animationController.stop();
    //       indexToPlay = indexToPlay - 1;
    //     });
    //   }
    // }
    if (indexToPlay > 0) {
      setState(() {
        animationController.reset();
        animationController.stop();
        indexToPlay = indexToPlay - 1;
      });
    }
  }

  _goToNext() {
    if (indexToPlay < widget.storyContents.length - 1) {
      setState(() {
        animationController.reset();
        animationController.stop();
        indexToPlay = indexToPlay + 1;
      });
    }
  }

  _pauseProgressBar() {
    setState(() {
      animationController.stop();
      showProgressBar = false;
    });
  }

  _resumeProgressBar() {
    setState(() {
      animationController.forward();
      showProgressBar = true;
    });
  }

  void onLoad(Duration duration) {
    animationController.reset();
    animationController.duration = duration;
  }

  void onPlay(double position) {
    animationController.value = position;
    animationController.forward();
  }

  Widget getStoryWidgets(Story story) {
    return story.when(
      image: (imageUrl, text) => _StoryImagePlayer(
        key: UniqueKey(),
        imageUrl: imageUrl,
        onLoad: onLoad,
        onPlay: onPlay,
        pauseProgressBar: _pauseProgressBar,
        resumeProgressBar: _resumeProgressBar,
        next: _goToNext,
        previous: _goToPrevious,
      ),
      video: (videoUrl, text) => _StoryVideoPlayer(
        key: UniqueKey(),
        videoUrl: videoUrl,
        onPlay: onPlay,
        onLoad: onLoad,
        pauseProgressBar: _pauseProgressBar,
        resumeProgressBar: _resumeProgressBar,
        next: _goToNext,
        previous: _goToPrevious,
      ),
      text: (text) => _StoryTextPlayer(
        key: UniqueKey(),
        content: text,
        onLoad: onLoad,
        onPlay: onPlay,
        pauseProgressBar: _pauseProgressBar,
        resumeProgressBar: _resumeProgressBar,
        next: _goToNext,
        previous: _goToPrevious,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        storyWidgets[indexToPlay],
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: showProgressBar ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return StoryProgressBar(
                  gap: 3,
                  progress: animationController.value,
                  length: widget.storyContents.length,
                  activeBar: indexToPlay,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Row nextPrevGestureDetector() {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: _goToPrevious,
        )),
        Expanded(
          child: GestureDetector(
            onTap: _goToNext,
          ),
        ),
      ],
    );
  }
}

class _StoryVideoPlayer extends StatefulWidget {
  const _StoryVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.onPlay,
    required this.onLoad,
    required this.pauseProgressBar,
    required this.resumeProgressBar,
    required this.next,
    required this.previous,
  }) : super(key: key);

  final String videoUrl;

  final void Function(double position) onPlay;
  final void Function(Duration duration) onLoad;
  final void Function() pauseProgressBar;
  final void Function() resumeProgressBar;
  final void Function() next;
  final void Function({BetterPlayerController controller}) previous;

  @override
  _StoryVideoPlayerState createState() => _StoryVideoPlayerState();
}

class _StoryVideoPlayerState extends State<_StoryVideoPlayer> {
  late final BetterPlayerController betterPlayerController;

  @override
  void initState() {
    super.initState();

    final betterPlayerDataSource = BetterPlayerDataSource.network(
      widget.videoUrl,
      cacheConfiguration: const BetterPlayerCacheConfiguration(useCache: true),
    );

    const betterPlayerConfiguration = BetterPlayerConfiguration(
      controlsConfiguration: BetterPlayerControlsConfiguration(
        showControls: false,
      ),
      autoPlay: true,
      fit: BoxFit.fitWidth,
      aspectRatio: 2 / 5,
      placeholder: LoadingIndicator(),
    );

    betterPlayerController = BetterPlayerController(
      betterPlayerConfiguration,
      betterPlayerDataSource: betterPlayerDataSource,
    );

    betterPlayerController.addEventsListener((p0) {
      if (p0.betterPlayerEventType == BetterPlayerEventType.initialized) {
        widget.onLoad(
            betterPlayerController.videoPlayerController!.value.duration!);
      }

      if (p0.betterPlayerEventType == BetterPlayerEventType.play) {
        widget.onPlay(betterPlayerController
                .videoPlayerController!.value.position.inSeconds /
            betterPlayerController
                .videoPlayerController!.value.duration!.inSeconds);
      }
    });
  }

  @override
  void dispose() {
    betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return storyGestureDetector(
      onLeftTap: widget.previous,
      onRightTap: widget.next,
      onLongPress: () async {
        await betterPlayerController.pause();
        widget.pauseProgressBar();
      },
      onLongPressUp: () async {
        await betterPlayerController.play();
        widget.resumeProgressBar();
      },
      child: BetterPlayer(
        controller: betterPlayerController,
      ),
    );
  }
}

class _StoryImagePlayer extends StatefulWidget {
  const _StoryImagePlayer({
    Key? key,
    required this.imageUrl,
    required this.onLoad,
    required this.onPlay,
    required this.pauseProgressBar,
    required this.resumeProgressBar,
    required this.next,
    required this.previous,
  }) : super(key: key);

  final String imageUrl;

  final void Function(Duration duration) onLoad;
  final void Function(double position) onPlay;
  final void Function() pauseProgressBar;
  final void Function() resumeProgressBar;
  final void Function() next;
  final void Function() previous;

  @override
  State<_StoryImagePlayer> createState() => _StoryImagePlayerState();
}

class _StoryImagePlayerState extends State<_StoryImagePlayer> {
  late CachedNetworkImageProvider cachedNetworkImage;

  late Future<File> future;

  @override
  void initState() {
    super.initState();

    future = DefaultCacheManager().getSingleFile(widget.imageUrl)
      ..then((_) {
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          widget.onLoad(defaultStoryDuration);
          widget.onPlay(0);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return storyGestureDetector(
      onLeftTap: widget.previous,
      onRightTap: widget.next,
      onLongPress: () async {
        widget.pauseProgressBar();
      },
      onLongPressUp: () async {
        widget.resumeProgressBar();
      },
      child: FutureBuilder<File>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Icon(Icons.error);
          }
          if (snapshot.hasData) {
            return Image.file(snapshot.data!);
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}

class _StoryTextPlayer extends StatefulWidget {
  const _StoryTextPlayer({
    Key? key,
    required this.content,
    required this.onLoad,
    required this.onPlay,
    required this.pauseProgressBar,
    required this.resumeProgressBar,
    required this.next,
    required this.previous,
  }) : super(key: key);

  final String content;

  final void Function(Duration duration) onLoad;
  final void Function(double position) onPlay;

  final void Function() pauseProgressBar;
  final void Function() resumeProgressBar;
  final void Function() next;
  final void Function() previous;

  @override
  State<_StoryTextPlayer> createState() => _StoryTextPlayerState();
}

class _StoryTextPlayerState extends State<_StoryTextPlayer> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.onLoad(defaultStoryDuration);
      widget.onPlay(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return storyGestureDetector(
      onLeftTap: widget.previous,
      onRightTap: widget.next,
      onLongPress: () async {
        widget.pauseProgressBar();
      },
      onLongPressUp: () async {
        widget.resumeProgressBar();
      },
      child: Center(
        child: Text(
          widget.content,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

Widget storyGestureDetector({
  required Function() onLeftTap,
  required Function() onRightTap,
  required Function() onLongPress,
  required Function() onLongPressUp,
  required Widget child,
}) {
  return Stack(
    fit: StackFit.expand,
    children: [
      child,
      Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: onLeftTap,
            onLongPress: onLongPress,
            onLongPressUp: onLongPressUp,
          )),
          Expanded(
            child: GestureDetector(
              onTap: onRightTap,
              onLongPress: onLongPress,
              onLongPressUp: onLongPressUp,
            ),
          ),
        ],
      ),
    ],
  );
}
