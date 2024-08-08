import 'package:hive/hive.dart';
import '../MySongModel/song_model.dart';

part 'playlist_model.g.dart';

@HiveType(typeId: 2)
class MyPlaylistModel extends HiveObject {
  @HiveField(0)
  String playlistName;

  @HiveField(1)
  List<MySongModel> songs;

  MyPlaylistModel({
    required this.playlistName,
    required this.songs,
  });
}
