import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music/utils/drawer.dart';
import 'package:music/utils/list_tile.dart';
import 'package:music/utils/topbar.dart';
import '../../bloc/player/player_bloc.dart';
import '../../utils/icon_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SongListPage extends StatefulWidget {
  const SongListPage({
    super.key,
  });

  @override
  State<SongListPage> createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: const AppDrawer(),
          appBar: TopBar(
            leading: MyIconButton(
              icon: Icons.menu,
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            title: Text(
              "Music",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: BlocBuilder<PlayerBloc, PlayerState>(
            builder: (context, state) {
              return (state.songList.isEmpty)
                  ? Center(
                      child: LoadingAnimationWidget.threeRotatingDots(
                        color: Colors.blueAccent,
                        size: 50,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.songList.length,
                      itemBuilder: (context, index) {
                        return MyListTile(
                          title: state.songList[index].songName,
                          subtitle: state.songList[index].artists ?? "",
                          artwork: state.songList[index].artwork,
                          onTap: () {
                            context.pushNamed(
                              'Player',
                              extra: {
                                'songModel': state.songList[index],
                                'playingList': "",
                              },
                            );
                          },
                        );
                      },
                    );
            },
          ),
        );
      },
    );
  }
}
