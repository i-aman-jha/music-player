import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/bottomsheet.dart';
import 'package:music/view/Library/Widgets/delete_playlist_dialog.dart';
import 'package:music/view/Library/Widgets/edit_playlist_dialog.dart';

class LibraryBottomsheet extends StatelessWidget {
  final String playlist;

  const LibraryBottomsheet({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      buildWhen: (current, previous) => false,
      builder: (context, state) {
        return MyBottomsheet(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: Text(
                "Edit Playlist",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return EditPlaylistDialog(playlistName: playlist);
                    });
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_sweep),
              title: Text(
                "Delete Playlist",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DeletePlaylistDialog(playlistName: playlist);
                    });
              },
            ),
          ],
        );
      },
    );
  }
}
