import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/dialog_box.dart';

class EditPlaylistDialog extends StatelessWidget {
  final String playlistName;

  const EditPlaylistDialog({
    super.key,
    required this.playlistName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      buildWhen: (current, previous) => false,
      builder: (context, state) {
        return DialogBox(
            title: "Edit Playlist",
            initialText: playlistName,
            hint: "New Playlist Name",
            buttonText: "Save",
            onSubmit: (newName) {
              context.pop();
              context
                  .read<PlayerBloc>()
                  .add(EditPlaylist(oldName: playlistName, newName: newName));
            });
      },
    );
  }
}
