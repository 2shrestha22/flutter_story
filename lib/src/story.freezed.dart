// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StoryTearOff {
  const _$StoryTearOff();

  StoryImage image({required String imageUrl, String? text}) {
    return StoryImage(
      imageUrl: imageUrl,
      text: text,
    );
  }

  StoryVideo video({required String videoUrl, String? text}) {
    return StoryVideo(
      videoUrl: videoUrl,
      text: text,
    );
  }

  StoryText text({required String text}) {
    return StoryText(
      text: text,
    );
  }
}

/// @nodoc
const $Story = _$StoryTearOff();

/// @nodoc
mixin _$Story {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String? text) image,
    required TResult Function(String videoUrl, String? text) video,
    required TResult Function(String text) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryImage value) image,
    required TResult Function(StoryVideo value) video,
    required TResult Function(StoryText value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res>;
}

/// @nodoc
class _$StoryCopyWithImpl<$Res> implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  final Story _value;
  // ignore: unused_field
  final $Res Function(Story) _then;
}

/// @nodoc
abstract class $StoryImageCopyWith<$Res> {
  factory $StoryImageCopyWith(
          StoryImage value, $Res Function(StoryImage) then) =
      _$StoryImageCopyWithImpl<$Res>;
  $Res call({String imageUrl, String? text});
}

/// @nodoc
class _$StoryImageCopyWithImpl<$Res> extends _$StoryCopyWithImpl<$Res>
    implements $StoryImageCopyWith<$Res> {
  _$StoryImageCopyWithImpl(StoryImage _value, $Res Function(StoryImage) _then)
      : super(_value, (v) => _then(v as StoryImage));

  @override
  StoryImage get _value => super._value as StoryImage;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? text = freezed,
  }) {
    return _then(StoryImage(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StoryImage implements StoryImage {
  const _$StoryImage({required this.imageUrl, this.text});

  @override
  final String imageUrl;
  @override
  final String? text;

  @override
  String toString() {
    return 'Story.image(imageUrl: $imageUrl, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoryImage &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  $StoryImageCopyWith<StoryImage> get copyWith =>
      _$StoryImageCopyWithImpl<StoryImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String? text) image,
    required TResult Function(String videoUrl, String? text) video,
    required TResult Function(String text) text,
  }) {
    return image(imageUrl, this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
  }) {
    return image?.call(imageUrl, this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(imageUrl, this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryImage value) image,
    required TResult Function(StoryVideo value) video,
    required TResult Function(StoryText value) text,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }
}

abstract class StoryImage implements Story {
  const factory StoryImage({required String imageUrl, String? text}) =
      _$StoryImage;

  String get imageUrl => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryImageCopyWith<StoryImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryVideoCopyWith<$Res> {
  factory $StoryVideoCopyWith(
          StoryVideo value, $Res Function(StoryVideo) then) =
      _$StoryVideoCopyWithImpl<$Res>;
  $Res call({String videoUrl, String? text});
}

/// @nodoc
class _$StoryVideoCopyWithImpl<$Res> extends _$StoryCopyWithImpl<$Res>
    implements $StoryVideoCopyWith<$Res> {
  _$StoryVideoCopyWithImpl(StoryVideo _value, $Res Function(StoryVideo) _then)
      : super(_value, (v) => _then(v as StoryVideo));

  @override
  StoryVideo get _value => super._value as StoryVideo;

  @override
  $Res call({
    Object? videoUrl = freezed,
    Object? text = freezed,
  }) {
    return _then(StoryVideo(
      videoUrl: videoUrl == freezed
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StoryVideo implements StoryVideo {
  const _$StoryVideo({required this.videoUrl, this.text});

  @override
  final String videoUrl;
  @override
  final String? text;

  @override
  String toString() {
    return 'Story.video(videoUrl: $videoUrl, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoryVideo &&
            (identical(other.videoUrl, videoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.videoUrl, videoUrl)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(videoUrl) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  $StoryVideoCopyWith<StoryVideo> get copyWith =>
      _$StoryVideoCopyWithImpl<StoryVideo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String? text) image,
    required TResult Function(String videoUrl, String? text) video,
    required TResult Function(String text) text,
  }) {
    return video(videoUrl, this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
  }) {
    return video?.call(videoUrl, this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(videoUrl, this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryImage value) image,
    required TResult Function(StoryVideo value) video,
    required TResult Function(StoryText value) text,
  }) {
    return video(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
  }) {
    return video?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(this);
    }
    return orElse();
  }
}

abstract class StoryVideo implements Story {
  const factory StoryVideo({required String videoUrl, String? text}) =
      _$StoryVideo;

  String get videoUrl => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryVideoCopyWith<StoryVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryTextCopyWith<$Res> {
  factory $StoryTextCopyWith(StoryText value, $Res Function(StoryText) then) =
      _$StoryTextCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$StoryTextCopyWithImpl<$Res> extends _$StoryCopyWithImpl<$Res>
    implements $StoryTextCopyWith<$Res> {
  _$StoryTextCopyWithImpl(StoryText _value, $Res Function(StoryText) _then)
      : super(_value, (v) => _then(v as StoryText));

  @override
  StoryText get _value => super._value as StoryText;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(StoryText(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoryText implements StoryText {
  const _$StoryText({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'Story.text(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoryText &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  $StoryTextCopyWith<StoryText> get copyWith =>
      _$StoryTextCopyWithImpl<StoryText>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String imageUrl, String? text) image,
    required TResult Function(String videoUrl, String? text) video,
    required TResult Function(String text) text,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String imageUrl, String? text)? image,
    TResult Function(String videoUrl, String? text)? video,
    TResult Function(String text)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoryImage value) image,
    required TResult Function(StoryVideo value) video,
    required TResult Function(StoryText value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoryImage value)? image,
    TResult Function(StoryVideo value)? video,
    TResult Function(StoryText value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class StoryText implements Story {
  const factory StoryText({required String text}) = _$StoryText;

  String get text => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryTextCopyWith<StoryText> get copyWith =>
      throw _privateConstructorUsedError;
}
