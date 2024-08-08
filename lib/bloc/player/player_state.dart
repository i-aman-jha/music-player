part of 'player_bloc.dart';

class PlayerState extends Equatable {
  final bool isPlaying;
  final Duration? duration;
  final Duration? position;
  final MySongModel? songModel;
  final List<MySongModel> songList;
  final List<MySongModel> searchList;
  final bool bottomPlayer;
  final Map<String, List<MySongModel>> library;
  final String? playingList;
  final RepeatMode repeat;
  final bool shuffle;

  const PlayerState({
    this.isPlaying = true,
    this.duration,
    this.position,
    this.songModel,
    this.songList = const [],
    this.bottomPlayer = false,
    this.searchList = const [],
    this.library = const {},
    this.playingList,
    this.repeat = RepeatMode.off,
    this.shuffle = false,
  });

  PlayerState copyWith({
    bool? isPlaying,
    Duration? duration,
    Duration? position,
    MySongModel? songModel,
    List<MySongModel>? songList,
    List<MySongModel>? searchList,
    bool? bottomPlayer,
    Map<String, List<MySongModel>>? library,
    String? playingList,
    RepeatMode? repeat,
    bool? shuffle,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      songModel: songModel ?? this.songModel,
      songList: songList ?? this.songList,
      bottomPlayer: bottomPlayer ?? this.bottomPlayer,
      searchList: searchList ?? this.searchList,
      library: library ?? this.library,
      playingList: playingList ?? this.playingList,
      repeat: repeat ?? this.repeat,
      shuffle: shuffle ?? this.shuffle,
    );
  }

  @override
  List<Object?> get props => [
        isPlaying,
        duration,
        position,
        songModel,
        songList,
        bottomPlayer,
        searchList,
        library,
        playingList,
        repeat,
        shuffle,
      ];
}
