import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music/Services/playlist_service.dart';
import 'package:music/models/PlaylistModel/playlist_model.dart';
import 'package:music/utils/Constants/repeat_mode.dart';
import '../../Repository/SongRepo/song_repository.dart';
import '../../models/MySongModel/song_model.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvents, PlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<MySongModel> songList = [];
  List<MySongModel> tempList = [];
  List<MySongModel> searchList = [];

  final SongRepository songRepository;
  final PlaylistService playlistService;

  PlayerBloc(this.songRepository, this.playlistService)
      : super(const PlayerState()) {
    on<GetSongsList>(_getSongsList);
    on<TimeProgress>(_updateTime);
    on<Play>(_play);
    on<Resume>(_resume);
    on<Pause>(_pause);
    on<Seek>(_seek);
    on<Next>(_next);
    on<Previous>(_prev);
    on<Repeat>(_repeat);
    on<Shuffle>(_shuffle);
    on<CloseBottomPlayer>(_close);
    on<SearchSong>(_search);
    on<NewPlaylist>(_newPlaylist);
    on<DeletePlaylist>(_deletePlaylist);
    on<EditPlaylist>(_editPlaylist);
    on<AddToPlaylist>(_addToPlaylist);
    on<RemoveFromPlaylist>(_removeFromPlaylist);

    _audioPlayer.onPositionChanged.listen((Duration position) {
      add(TimeProgress());
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      if (state.repeat == RepeatMode.repeatOne) {
        add(Play(songModel: state.songModel ?? songList[0]));
      } else {
        add(Next());
      }
    });
  }

  Future<void> _getSongsList(
      GetSongsList event, Emitter<PlayerState> emit) async {
    final mySongList = await songRepository.getSongs();
    final playlists = playlistService.getPlaylists();
    Map<String, List<MySongModel>> library = {};
    if (playlists.isEmpty) {
      final favourites = MyPlaylistModel(playlistName: "Favourites", songs: []);
      final playlist1 = MyPlaylistModel(playlistName: "Playlist 1", songs: []);
      playlistService.addPlaylist(favourites);
      playlistService.addPlaylist(playlist1);
      library = {'Favourites': [], 'Playlist 1': []};
    } else {
      for (final playlist in playlists) {
        library[playlist.playlistName] = playlist.songs;
      }
    }
    emit(state.copyWith(songList: mySongList, library: library));
  }

  Future<void> _play(Play event, Emitter<PlayerState> emit) async {
    var assetSource = DeviceFileSource(event.songModel.path);
    await _audioPlayer.setSource(assetSource);
    Duration? duration = await _audioPlayer.getDuration();
    await _audioPlayer.play(assetSource);
    if (event.playingList != null && event.playingList != state.playingList) {
      songList = (event.playingList == "")
          ? state.songList
          : state.library[event.playingList] ?? [];
      emit(state.copyWith(shuffle: false));
    }

    emit(state.copyWith(
      duration: duration,
      songModel: event.songModel,
      isPlaying: true,
      bottomPlayer: true,
      playingList: event.playingList,
    ));
  }

  Future<void> _updateTime(
      TimeProgress event, Emitter<PlayerState> emit) async {
    Duration? curr = await _audioPlayer.getCurrentPosition();
    emit(state.copyWith(position: curr));
  }

  Future<void> _resume(Resume event, Emitter<PlayerState> emit) async {
    _audioPlayer.resume();
    emit(state.copyWith(isPlaying: true));
  }

  Future<void> _pause(Pause event, Emitter<PlayerState> emit) async {
    await _audioPlayer.pause();
    emit(state.copyWith(isPlaying: false));
  }

  Future<void> _seek(Seek event, Emitter<PlayerState> emit) async {
    await _audioPlayer.seek(Duration(milliseconds: event.position.round()));
  }

  Future<void> _next(Next event, Emitter<PlayerState> emit) async {
    if (state.songModel != null) {
      _audioPlayer.pause();
      int index =
          songList.indexWhere((element) => element.id == state.songModel!.id);
      if (index == songList.length - 1) {
        if (state.repeat == RepeatMode.repeatAll) {
          add(Play(songModel: songList[0]));
        } else {
          var assetSource = DeviceFileSource(songList[0].path);
          await _audioPlayer.setSource(assetSource);
          Duration? duration = await _audioPlayer.getDuration();
          emit(state.copyWith(
            isPlaying: false,
            songModel: songList[0],
            duration: duration,
          ));
        }
      } else {
        index += 1;
        final nextSong = songList[index];
        emit(state.copyWith(songModel: nextSong));
        add(Play(songModel: nextSong));
      }
    }
  }

  Future<void> _prev(Previous event, Emitter<PlayerState> emit) async {
    if (state.songModel != null) {
      _audioPlayer.pause();
      int index =
          songList.indexWhere((element) => element.id == state.songModel!.id);
      if (index == 0) {
        index = 0;
        await _audioPlayer.seek(const Duration(milliseconds: 0));
      } else {
        index -= 1;
      }
      emit(state.copyWith(songModel: songList[index]));
      add(Play(songModel: songList[index]));
    }
  }

  Future<void> _shuffle(Shuffle event, Emitter<PlayerState> emit) async {
    if (state.shuffle) {
      songList = tempList;
      emit(state.copyWith(shuffle: false));
    } else {
      List<MySongModel> shuffledList = List.from(songList);
      shuffledList.shuffle(Random());
      tempList = songList;
      songList = shuffledList;
      emit(state.copyWith(shuffle: true));
    }
  }

  Future<void> _repeat(Repeat event, Emitter<PlayerState> emit) async {
    final RepeatMode mode;
    if (state.repeat == RepeatMode.off) {
      mode = RepeatMode.repeatAll;
    } else if (state.repeat == RepeatMode.repeatAll) {
      mode = RepeatMode.repeatOne;
    } else {
      mode = RepeatMode.off;
    }
    emit(state.copyWith(repeat: mode));
  }

  Future<void> _close(
      CloseBottomPlayer event, Emitter<PlayerState> emit) async {
    _audioPlayer.stop();
    emit(state.copyWith(
        bottomPlayer: false,
        songModel: const MySongModel(
            id: -1,
            songName: "Unknown",
            artists: "Unknown",
            path: "",
            artwork: null)));
  }

  void _search(SearchSong event, Emitter<PlayerState> emit) {
    searchList = state.songList
        .where((element) =>
            element.songName.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    emit(state.copyWith(searchList: searchList));
  }

  void _newPlaylist(NewPlaylist event, Emitter<PlayerState> emit) {
    final updatedLibrary = Map<String, List<MySongModel>>.from(state.library)
      ..putIfAbsent(event.playlist, () => []);
    final newPlaylist =
        MyPlaylistModel(playlistName: event.playlist, songs: []);
    playlistService.addPlaylist(newPlaylist);
    emit(state.copyWith(library: updatedLibrary));
  }

  void _deletePlaylist(DeletePlaylist event, Emitter<PlayerState> emit) {
    final updatedLibrary = Map<String, List<MySongModel>>.from(state.library);
    updatedLibrary.remove(event.playlist);
    playlistService.deletePlaylist(event.playlist);
    emit(state.copyWith(library: updatedLibrary));
  }

  void _editPlaylist(EditPlaylist event, Emitter<PlayerState> emit) {
    final updatedLibrary = Map<String, List<MySongModel>>.from(state.library);
    final values = updatedLibrary[event.oldName];
    updatedLibrary.remove(event.oldName);
    updatedLibrary[event.newName] = values ?? [];
    playlistService.editPlaylist(event.oldName, event.newName);
    emit(state.copyWith(library: updatedLibrary));
  }

  void _addToPlaylist(AddToPlaylist event, Emitter<PlayerState> emit) {
    final updatedLibrary = Map<String, List<MySongModel>>.from(state.library);
    final playlistSongs = updatedLibrary[event.playlist]?.toList() ?? [];
    MySongModel songModel = state.songList[
        state.songList.indexWhere((element) => element.id == event.id)];
    if (!playlistSongs.contains(songModel)) {
      playlistSongs.add(songModel);
    } else {
      playlistSongs.remove(songModel);
    }
    playlistService.addToPlaylist(event.playlist, playlistSongs);
    updatedLibrary[event.playlist] = playlistSongs;
    emit(state.copyWith(library: updatedLibrary));
  }

  void _removeFromPlaylist(
      RemoveFromPlaylist event, Emitter<PlayerState> emit) {
    final updatedLibrary = Map<String, List<MySongModel>>.from(state.library);
    final playlistSongs = updatedLibrary[event.playlist]?.toList() ?? [];
    MySongModel songModel = state.songList[
        state.songList.indexWhere((element) => element.id == event.id)];
    playlistSongs.remove(songModel);
    updatedLibrary[event.playlist] = playlistSongs;
    emit(state.copyWith(library: updatedLibrary));
  }
}
