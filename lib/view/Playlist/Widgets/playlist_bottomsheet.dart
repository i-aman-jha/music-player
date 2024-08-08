import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/utils/bottomsheet.dart';
import '../../../bloc/player/player_bloc.dart';
import '../../Player/Widgets/add_playlist_bottomsheet.dart';

class PlaylistBottomsheet extends StatelessWidget {
  final String playlistName;
  final int id;

  const PlaylistBottomsheet({
    super.key,
    required this.playlistName,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      buildWhen: (current, previous) => false,
      builder: (context, state) {
        return MyBottomsheet(
          children: [
            ListTile(
              leading: const Icon(Icons.playlist_add),
              title: Text(
                "Add to other playlist",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet<dynamic>(
                  elevation: 20,
                  isScrollControlled: true,
                  isDismissible: true,
                  context: context,
                  builder: (context) {
                    return AddToPlaylistBottomSheet(id: id);
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: Text(
                "Remove from this playlist",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                context
                    .read<PlayerBloc>()
                    .add(RemoveFromPlaylist(playlist: playlistName, id: id));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
