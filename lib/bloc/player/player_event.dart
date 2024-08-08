part of 'player_bloc.dart';

sealed class PlayerEvents extends Equatable {
  const PlayerEvents();

  @override
  List<Object?> get props => [];
}

class TimeProgress extends PlayerEvents {}

class Play extends PlayerEvents {
  final MySongModel songModel;
  final String? playingList;

  const Play({
    required this.songModel,
    this.playingList,
  });

  @override
  List<Object?> get props => [songModel, playingList];
}

class Resume extends PlayerEvents {}

class Pause extends PlayerEvents {}

class Seek extends PlayerEvents {
  final double position;

  const Seek({required this.position});

  @override
  // TODO: implement props
  List<Object?> get props => [position];
}

class Shuffle extends PlayerEvents {}

class Previous extends PlayerEvents {}

class Next extends PlayerEvents {}

class Repeat extends PlayerEvents {}

class GetSongsList extends PlayerEvents {}

class CloseBottomPlayer extends PlayerEvents {}

class SearchSong extends PlayerEvents {
  final String query;

  const SearchSong({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}

class NewPlaylist extends PlayerEvents {
  final String playlist;

  const NewPlaylist({required this.playlist});

  @override
  // TODO: implement props
  List<Object?> get props => [playlist];
}

class DeletePlaylist extends PlayerEvents {
  final String playlist;

  const DeletePlaylist({required this.playlist});

  @override
  // TODO: implement props
  List<Object?> get props => [playlist];
}

class EditPlaylist extends PlayerEvents {
  final String newName;
  final String oldName;

  const EditPlaylist({
    required this.newName,
    required this.oldName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [newName, oldName];
}

class AddToPlaylist extends PlayerEvents {
  final String playlist;
  final int id;

  const AddToPlaylist({required this.playlist, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [playlist, id];
}

class RemoveFromPlaylist extends PlayerEvents {
  final String playlist;
  final int id;

  const RemoveFromPlaylist({required this.playlist, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [playlist, id];
}
