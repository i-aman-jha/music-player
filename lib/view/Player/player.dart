import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/topbar.dart';
import 'package:music/view/Player/Widgets/add_playlist_bottomsheet.dart';
import 'package:music/view/Player/Widgets/player_controller.dart';
import '../../models/MySongModel/song_model.dart';
import '../../utils/icon_button.dart';
import 'Widgets/song_details.dart';
import 'Widgets/time_progressbar.dart';

class Player extends StatefulWidget {
  final MySongModel songModel;
  final String? playingList;
  final bool playEvent;

  const Player({
    super.key,
    required this.songModel,
    this.playingList,
    required this.playEvent,
  });

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.playEvent) {
      context.read<PlayerBloc>().add(
          Play(songModel: widget.songModel, playingList: widget.playingList));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: TopBar(
            leading: MyIconButton(
              icon: Icons.keyboard_arrow_down,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              "Now Playing",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: Builder(builder: (BuildContext context) {
              return MyIconButton(
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    elevation: 20,
                    isScrollControlled: true,
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return AddToPlaylistBottomSheet(
                        id: (state.songModel != null) ? state.songModel!.id : 0,
                      );
                    },
                  );
                },
                icon: Icons.playlist_add,
              );
            }),
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SongDetails(),
              TimeProgBar(timeProgress: 0),
              PlayerController(),
            ],
          ),
          // ),
        );
      },
    );
  }
}
