import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../../utils/uint8_list_converter.dart';

part 'song_model.freezed.dart';

part 'song_model.g.dart';

@HiveType(typeId: 1)
@freezed
class MySongModel with _$MySongModel {
  const factory MySongModel({
    @HiveField(0) required int id,
    @HiveField(1) required String songName,
    @HiveField(2) required String? artists,
    @HiveField(3) required String path,
    @HiveField(4) @Uint8ListConverter() required Uint8List? artwork,
  }) = _MySongModel;

  factory MySongModel.fromJson(Map<String, Object?> json) =>
      _$MySongModelFromJson(json);
}
