import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/player/player_bloc.dart';
import 'package:music/utils/Constants/repeat_mode.dart';
import 'package:music/view/Player/Widgets/player_button.dart';

class PlayerController extends StatefulWidget {
  const PlayerController({
    super.key,
  });

  @override
  State<PlayerController> createState() => _PlayerControllerState();
}

class _PlayerControllerState extends State<PlayerController> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<PlayerBloc, PlayerState>(
                // buildWhen: (current, previous) => false,
                builder: (context, state) {
                  return IconButton(
                    icon: Icon(
                      (state.shuffle)
                          ? Icons.shuffle_on_outlined
                          : Icons.shuffle,
                      size: 25,
                    ),
                    onPressed: () {
                      context.read<PlayerBloc>().add(Shuffle());
                    },
                  );
                },
              ),
              BlocBuilder<PlayerBloc, PlayerState>(
                buildWhen: (current, previous) => false,
                builder: (context, state) {
                  return PlayerButton(
                    icon: Icons.skip_previous,
                    onPressed: () {
                      context.read<PlayerBloc>().add(Previous());
                    },
                    size: 70,
                    play: false,
                  );
                },
              ),
              BlocBuilder<PlayerBloc, PlayerState>(
                buildWhen: (current, previous) =>
                    current.isPlaying != previous.isPlaying,
                builder: (context, state) {
                  return PlayerButton(
                    icon: (state.isPlaying) ? Icons.pause : Icons.play_arrow,
                    onPressed: () {
                      (state.isPlaying)
                          ? context.read<PlayerBloc>().add(Pause())
                          : context.read<PlayerBloc>().add(Resume());
                    },
                    size: 70,
                    play: true,
                  );
                },
              ),
              BlocBuilder<PlayerBloc, PlayerState>(
                buildWhen: (current, previous) => false,
                builder: (context, state) {
                  return PlayerButton(
                    icon: Icons.skip_next,
                    onPressed: () {
                      context.read<PlayerBloc>().add(Next());
                    },
                    size: 70,
                    play: false,
                  );
                },
              ),
              BlocBuilder<PlayerBloc, PlayerState>(
                // buildWhen: (current, previous) => false,
                builder: (context, state) {
                  return IconButton(
                    icon: Icon(
                      (state.repeat == RepeatMode.repeatAll)
                          ? Icons.repeat_on
                          : (state.repeat == RepeatMode.repeatOne)
                              ? Icons.repeat_one_on_outlined
                              : Icons.repeat,
                      size: 25,
                    ),
                    onPressed: () {
                      context.read<PlayerBloc>().add(Repeat());
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
