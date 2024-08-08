import 'package:hive/hive.dart';
import 'package:music/models/MySongModel/song_model.dart';
import 'package:music/models/PlaylistModel/playlist_model.dart';

class PlaylistService {
  final Box<MyPlaylistModel> _playlistBox;

  PlaylistService(this._playlistBox);

  Future<void> addPlaylist(MyPlaylistModel playlist) async {
    await _playlistBox.add(playlist);
  }

  List<MyPlaylistModel> getPlaylists() {
    return _playlistBox.values.toList();
  }

  Future<void> editPlaylist(String oldName, String newName) async {
    final index = _playlistBox.values
        .toList()
        .indexWhere((element) => element.playlistName == oldName);
    final playlist = MyPlaylistModel(
        playlistName: newName,
        songs: _playlistBox.values.toList()[index].songs);
    await _playlistBox.putAt(index, playlist);
  }

  Future<void> addToPlaylist(
      String playlistName, List<MySongModel> songs) async {
    final index = _playlistBox.values
        .toList()
        .indexWhere((element) => element.playlistName == playlistName);
    final playlist = MyPlaylistModel(playlistName: playlistName, songs: songs);
    await _playlistBox.putAt(index, playlist);
  }

  Future<void> deletePlaylist(String playlist) async {
    final index = _playlistBox.values
        .toList()
        .indexWhere((element) => element.playlistName == playlist);
    await _playlistBox.deleteAt(index);
  }
}
