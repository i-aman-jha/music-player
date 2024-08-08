import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/drawer.dart';
import 'package:music/utils/list_tile.dart';
import '../../utils/icon_button.dart';
import '../../utils/topbar.dart';
import 'Widgets/create_playlist_dialog.dart';
import 'Widgets/library_bottomsheet.dart';

class Library extends StatefulWidget {
  const Library({
    super.key,
  });

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TopBar(
        leading: MyIconButton(
          icon: Icons.menu,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          "Library",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: MyIconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const NewPlaylistDialog();
                });
          },
          icon: Icons.add,
        ),
      ),
      drawer: const AppDrawer(),
      body: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          final keys = state.library.keys.toList();
          final values = state.library.values.toList();
          return ListView.builder(
              itemCount: state.library.length,
              itemBuilder: (context, index) {
                return MyListTile(
                  title: keys[index],
                  subtitle: "${values[index].length} Tracks",
                  trailing: IconButton(
                    onPressed: () {
                      showLibraryBottomSheet(context, keys[index]);
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                  onLongPressed: () {
                    showLibraryBottomSheet(context, keys[index]);
                  },
                  onTap: () {
                    context.goNamed(
                      'Playlist',
                      extra: keys[index],
                    );
                  },
                );
              });
        },
      ),
    );
  }
}

void showLibraryBottomSheet(BuildContext context, String playlist) {
  showModalBottomSheet<dynamic>(
    useRootNavigator: true,
    elevation: 20,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return LibraryBottomsheet(
        playlist: playlist,
      );
    },
  );
}
