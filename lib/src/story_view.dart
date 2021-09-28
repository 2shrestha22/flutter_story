import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer';

import 'package:better_player/better_player.dart';

import '../flutter_story.dart';
import 'loading_indicator.dart';
import 'story_progress_bar.dart';

class StoryView extends StatefulWidget {
  const StoryView({Key? key, required this.storyContents}) : super(key: key);

  final List<Story> storyContents;

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView>
    with SingleTickerProviderStateMixin {
  int indexToPlay = 0;

  late List<Widget> storyWidgets;

  late AnimationController animationController;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    initStoryWidgets();

    pageController = PageController();

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
    pageController.dispose();
    super.dispose();
  }

  // TODO work in progress
  // _rewind() {
  //   // reset progressbar
  //   animationController.reset();
  //   animationController.forward();
  // }

  _goToPrevious() {
    if (indexToPlay > 0) {
      setState(() {
        indexToPlay--;
      });
      // reset progressbar
      animationController.reset();
      pageController.animateToPage(indexToPlay,
          curve: Curves.ease, duration: const Duration(milliseconds: 500));
    }
  }

  _goToNext() {
    if (indexToPlay < widget.storyContents.length - 1) {
      setState(() {
        indexToPlay++;
      });
      // reset progressbar
      animationController.reset();
      pageController.animateToPage(indexToPlay,
          curve: Curves.ease, duration: const Duration(milliseconds: 500));
    }
  }

  void onLoad(Duration duration) {
    animationController.reset();
    animationController.duration = duration;
  }

  void onPlay(double position) {
    animationController.value = position;
    animationController.forward();
  }

  initStoryWidgets() {
    List<Widget> _storyWidgets = [];
    for (var storyContent in widget.storyContents) {
      final storyWidget = storyContent.when(
        image: (imageUrl, text) => _StoryImagePlayer(
          imageUrl: imageUrl,
          onLoad: onLoad,
          onPlay: onPlay,
        ),
        video: (videoUrl, text) => _StoryVideoPlayer(
          videoUrl: videoUrl,
          onPlay: onPlay,
          onLoad: onLoad,
        ),
        text: (text) => _StoryTextPlayer(
          content: text,
          onLoad: onLoad,
          onPlay: onPlay,
        ),
      );
      _storyWidgets.add(storyWidget);
    }
    storyWidgets = _storyWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // storyWidgets[indexToPlay],
        PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: storyWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return storyWidgets[index];
          },
        ),
        nextPrevGestureDetector(),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return StoryProgressBar(
                gap: 3,
                progress: animationController.value,
                length: storyWidgets.length,
                activeBar: indexToPlay,
              );
            },
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
  const _StoryVideoPlayer(
      {Key? key,
      required this.videoUrl,
      required this.onPlay,
      required this.onLoad})
      : super(key: key);

  final String videoUrl;

  final void Function(double position) onPlay;
  final void Function(Duration duration) onLoad;

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
        cacheConfiguration:
            const BetterPlayerCacheConfiguration(useCache: true));

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
    return BetterPlayer(
      controller: betterPlayerController,
    );
  }
}

class _StoryImagePlayer extends StatefulWidget {
  const _StoryImagePlayer(
      {Key? key,
      required this.imageUrl,
      required this.onLoad,
      required this.onPlay})
      : super(key: key);

  final String imageUrl;

  final void Function(Duration duration) onLoad;
  final void Function(double position) onPlay;

  @override
  State<_StoryImagePlayer> createState() => _StoryImagePlayerState();
}

class _StoryImagePlayerState extends State<_StoryImagePlayer> {
  late CachedNetworkImageProvider cachedNetworkImage;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // 5 second view time for image only story
      // widget.onLoad(const Duration(seconds: 5));
      // widget.onPlay(0);
    });

    cachedNetworkImage = CachedNetworkImageProvider(widget.imageUrl)
      ..resolve(const ImageConfiguration())
          .addListener(ImageStreamListener((_, __) {
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          // 5 second view time for image only story
          widget.onLoad(const Duration(seconds: 5));
          widget.onPlay(0);
        });
      }));
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Image(image: cachedNetworkImage);
      },
      imageUrl: widget.imageUrl,
      placeholder: (_, __) => const LoadingIndicator(),
    );
  }
}

class _StoryTextPlayer extends StatefulWidget {
  const _StoryTextPlayer(
      {Key? key,
      required this.content,
      required this.onLoad,
      required this.onPlay})
      : super(key: key);

  final String content;

  final void Function(Duration duration) onLoad;
  final void Function(double position) onPlay;

  @override
  State<_StoryTextPlayer> createState() => _StoryTextPlayerState();
}

class _StoryTextPlayerState extends State<_StoryTextPlayer> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // 5 second view time for text only story
      widget.onLoad(const Duration(seconds: 5));
      widget.onPlay(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.content,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
