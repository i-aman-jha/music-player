import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/dialog_box.dart';

class NewPlaylistDialog extends StatefulWidget {
  const NewPlaylistDialog({
    super.key,
  });

  @override
  State<NewPlaylistDialog> createState() => _NewPlaylistDialogState();
}

class _NewPlaylistDialogState extends State<NewPlaylistDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return DialogBox(
            title: "New Playlist",
            initialText: "",
            hint: "New Playlist Name",
            buttonText: "Create",
            onSubmit: (playlistName) {
              context
                  .read<PlayerBloc>()
                  .add(NewPlaylist(playlist: playlistName));
            });
      },
    );
  }
}
