// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MySongModelAdapter extends TypeAdapter<MySongModel> {
  @override
  final int typeId = 1;

  @override
  MySongModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MySongModel(
      id: fields[0] as int,
      songName: fields[1] as String,
      artists: fields[2] as String?,
      path: fields[3] as String,
      artwork: fields[4] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, MySongModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.songName)
      ..writeByte(2)
      ..write(obj.artists)
      ..writeByte(3)
      ..write(obj.path)
      ..writeByte(4)
      ..write(obj.artwork);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MySongModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MySongModelImpl _$$MySongModelImplFromJson(Map<String, dynamic> json) =>
    _$MySongModelImpl(
      id: (json['id'] as num).toInt(),
      songName: json['songName'] as String,
      artists: json['artists'] as String?,
      path: json['path'] as String,
      artwork: const Uint8ListConverter().fromJson(json['artwork'] as String?),
    );

Map<String, dynamic> _$$MySongModelImplToJson(_$MySongModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'songName': instance.songName,
      'artists': instance.artists,
      'path': instance.path,
      'artwork': const Uint8ListConverter().toJson(instance.artwork),
    };
