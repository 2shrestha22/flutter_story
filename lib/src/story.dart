import 'package:freezed_annotation/freezed_annotation.dart';
part 'story.freezed.dart';

@freezed
class Story with _$Story {
  const factory Story.image({required String imageUrl, String? text}) =
      StoryImage;
  const factory Story.video({required String videoUrl, String? text}) =
      StoryVideo;
  const factory Story.text({required String text}) = StoryText;
}
