import 'package:flutter/material.dart';
import 'package:flutter_story/flutter_story.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FeedView(),
    );
  }
}

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: StoryView(
        storyContents: [
          Story.image(imageUrl: 'https://picsum.photos/id/123/400/800'),
          Story.image(imageUrl: 'https://picsum.photos/id/1000/400/800'),
          Story.image(imageUrl: 'https://picsum.photos/id/10/400/800'),
        ],
      ),
    );
  }
}
