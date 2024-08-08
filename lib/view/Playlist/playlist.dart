import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/player/player_bloc.dart';
import '../../models/MySongModel/song_model.dart';
import '../../utils/icon_button.dart';
import '../../utils/list_tile.dart';
import '../../utils/topbar.dart';
import 'Widgets/playlist_bottomsheet.dart';

class Playlist extends StatelessWidget {
  final String playlistName;

  const Playlist({
    super.key,
    required this.playlistName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        leading: MyIconButton(
          icon: Icons.arrow_back_ios_new,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          playlistName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          final List<MySongModel> songList = state.library[playlistName] ?? [];
          if (songList.isEmpty) {
            return const Center(
              child: Text("No songs"),
            );
          } else {
            return ListView.builder(
              itemCount: songList.length,
              itemBuilder: (context, index) {
                return MyListTile(
                  title: songList[index].songName,
                  subtitle: songList[index].artists ?? "",
                  artwork: songList[index].artwork,
                  onTap: () {
                    context.pushNamed(
                      'Player',
                      extra: {
                        'songModel': songList[index],
                        'playingList': playlistName,
                      },
                    );
                  },
                  trailing: IconButton(
                    onPressed: () {
                      showPlaylistBottomSheet(
                          context, playlistName, songList[index].id);
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void showPlaylistBottomSheet(
    BuildContext context, String playlistName, int id) {
  showModalBottomSheet<dynamic>(
    useRootNavigator: true,
    elevation: 20,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return PlaylistBottomsheet(
        playlistName: playlistName,
        id: id,
      );
    },
  );
}
