import 'package:flutter/foundation.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:music/models/MySongModel/song_model.dart';

class SongRepository {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<List<MySongModel>> getSongs() async {
    final List<MySongModel> songList = [];

    try {
      // Check and request permissions if necessary
      bool hasPermission = await _audioQuery.checkAndRequest();

      if (!hasPermission) {
        return songList; // Return empty list or handle accordingly
      }

      // Query songs if permission granted
      final List<SongModel> songs = await _audioQuery.querySongs();

      for (final song in songs) {
        Uint8List? artwork = await _audioQuery.queryArtwork(
          song.id,
          ArtworkType.AUDIO,
        );

        songList.add(MySongModel(
          id: song.id,
          songName: song.title,
          artists: song.artist ?? "Unknown Artist",
          path: song.data,
          artwork: artwork,
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting songs: $e");
      }
    }

    return songList;
  }
}
