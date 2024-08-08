import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/bottomsheet.dart';
import 'package:music/utils/list_tile.dart';
import '../../../models/MySongModel/song_model.dart';
import '../../Library/Widgets/create_playlist_dialog.dart';

class AddToPlaylistBottomSheet extends StatelessWidget {
  final int id;

  const AddToPlaylistBottomSheet({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return MyBottomsheet(
          children: [
            Text(
              "Add to Playlist",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const NewPlaylistDialog();
                    });
              },
              child: const Text("New Playlist"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: state.library.length,
                itemBuilder: (context, index) {
                  List<String> keys = state.library.keys.toList();
                  List<List<MySongModel>> values =
                      state.library.values.toList();
                  MySongModel songModel = state.songList[
                      state.songList.indexWhere((element) => element.id == id)];
                  return MyListTile(
                    title: keys[index],
                    subtitle: "${values[index].length} Tracks",
                    onTap: () {
                      context
                          .read<PlayerBloc>()
                          .add(AddToPlaylist(playlist: keys[index], id: id));
                    },
                    trailing: Checkbox(
                        onChanged: (value) {
                          context.read<PlayerBloc>().add(
                              AddToPlaylist(playlist: keys[index], id: id));
                        },
                        value: state.library[keys[index]]?.contains(songModel)),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Done"),
            ),
          ],
        );
      },
    );
  }
}
