import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/dialog_box.dart';

class DeletePlaylistDialog extends StatelessWidget {
  final String playlistName;

  const DeletePlaylistDialog({
    super.key,
    required this.playlistName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      buildWhen: (current, previous) => false,
      builder: (context, state) {
        return DialogBox(
            title: "Delete Playlist",
            initialText: "",
            hint: "Are you sure you want to delete playlist?",
            buttonText: "Delete",
            formField: false,
            onSubmit: (value) {
              context.pop();
              context
                  .read<PlayerBloc>()
                  .add(DeletePlaylist(playlist: playlistName));
            });
      },
    );
  }
}
