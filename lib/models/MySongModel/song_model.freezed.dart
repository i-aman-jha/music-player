// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MySongModel _$MySongModelFromJson(Map<String, dynamic> json) {
  return _MySongModel.fromJson(json);
}

/// @nodoc
mixin _$MySongModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get songName => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get artists => throw _privateConstructorUsedError;
  @HiveField(3)
  String get path => throw _privateConstructorUsedError;
  @HiveField(4)
  @Uint8ListConverter()
  Uint8List? get artwork => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MySongModelCopyWith<MySongModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MySongModelCopyWith<$Res> {
  factory $MySongModelCopyWith(
          MySongModel value, $Res Function(MySongModel) then) =
      _$MySongModelCopyWithImpl<$Res, MySongModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String songName,
      @HiveField(2) String? artists,
      @HiveField(3) String path,
      @HiveField(4) @Uint8ListConverter() Uint8List? artwork});
}

/// @nodoc
class _$MySongModelCopyWithImpl<$Res, $Val extends MySongModel>
    implements $MySongModelCopyWith<$Res> {
  _$MySongModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? songName = null,
    Object? artists = freezed,
    Object? path = null,
    Object? artwork = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artists: freezed == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      artwork: freezed == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MySongModelImplCopyWith<$Res>
    implements $MySongModelCopyWith<$Res> {
  factory _$$MySongModelImplCopyWith(
          _$MySongModelImpl value, $Res Function(_$MySongModelImpl) then) =
      __$$MySongModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String songName,
      @HiveField(2) String? artists,
      @HiveField(3) String path,
      @HiveField(4) @Uint8ListConverter() Uint8List? artwork});
}

/// @nodoc
class __$$MySongModelImplCopyWithImpl<$Res>
    extends _$MySongModelCopyWithImpl<$Res, _$MySongModelImpl>
    implements _$$MySongModelImplCopyWith<$Res> {
  __$$MySongModelImplCopyWithImpl(
      _$MySongModelImpl _value, $Res Function(_$MySongModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? songName = null,
    Object? artists = freezed,
    Object? path = null,
    Object? artwork = freezed,
  }) {
    return _then(_$MySongModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artists: freezed == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      artwork: freezed == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MySongModelImpl with DiagnosticableTreeMixin implements _MySongModel {
  const _$MySongModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.songName,
      @HiveField(2) required this.artists,
      @HiveField(3) required this.path,
      @HiveField(4) @Uint8ListConverter() required this.artwork});

  factory _$MySongModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MySongModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String songName;
  @override
  @HiveField(2)
  final String? artists;
  @override
  @HiveField(3)
  final String path;
  @override
  @HiveField(4)
  @Uint8ListConverter()
  final Uint8List? artwork;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MySongModel(id: $id, songName: $songName, artists: $artists, path: $path, artwork: $artwork)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MySongModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('songName', songName))
      ..add(DiagnosticsProperty('artists', artists))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('artwork', artwork));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MySongModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.songName, songName) ||
                other.songName == songName) &&
            (identical(other.artists, artists) || other.artists == artists) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other.artwork, artwork));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, songName, artists, path,
      const DeepCollectionEquality().hash(artwork));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MySongModelImplCopyWith<_$MySongModelImpl> get copyWith =>
      __$$MySongModelImplCopyWithImpl<_$MySongModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MySongModelImplToJson(
      this,
    );
  }
}

abstract class _MySongModel implements MySongModel {
  const factory _MySongModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String songName,
      @HiveField(2) required final String? artists,
      @HiveField(3) required final String path,
      @HiveField(4)
      @Uint8ListConverter()
      required final Uint8List? artwork}) = _$MySongModelImpl;

  factory _MySongModel.fromJson(Map<String, dynamic> json) =
      _$MySongModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get songName;
  @override
  @HiveField(2)
  String? get artists;
  @override
  @HiveField(3)
  String get path;
  @override
  @HiveField(4)
  @Uint8ListConverter()
  Uint8List? get artwork;
  @override
  @JsonKey(ignore: true)
  _$$MySongModelImplCopyWith<_$MySongModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
