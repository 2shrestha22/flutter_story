
A Flutter package for creating TikTok like feed with images, videos and texts. Alos support Facebook like multiple media in a single feed.

## Usage

### Depend on it

Add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):
```yaml
dependencies:
  flutter_story:
    git:
      url: git://github.com/2shrestha22/flutter_story.git
```
### Import it

```dart
import 'package:flutter_story/flutter_story.dart';
```

### Usage it

```dart
StoryView(
  storyContents: [
    Story.image(imageUrl: 'https://picsum.photos/id/123/400/800'),
    Story.image(imageUrl: 'https://picsum.photos/id/1000/400/800'),
    Story.image(imageUrl: 'https://picsum.photos/id/10/400/800'),
  ],
);
```
