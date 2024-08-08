import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';

import '../../../bloc/player/player_bloc.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: (state.songModel != null)
                      ? state.songModel!.artwork != null
                          ? DecorationImage(
                              image: MemoryImage(state.songModel!.artwork!),
                              fit: BoxFit.cover,
                            )
                          : null
                      : null,
                ),
                child: (state.songModel != null)
                    ? (state.songModel!.artwork == null)
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                      Brightness.dark)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            child: const Icon(
                              Icons.music_note,
                              size: 100,
                              color: Colors.grey,
                            ),
                          )
                        : null
                    : null, // Don't display icon if artwork is available
              ),
            )),
            const SizedBox(height: 20),
            Text(
              (state.songModel != null) ? state.songModel!.songName : "",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 30,
                child: Marquee(
                  text: (state.songModel != null)
                      ? state.songModel!.artists ?? "Unknown"
                      : "Unknown",
                  style: Theme.of(context).textTheme.headlineSmall,
                  scrollAxis: Axis.horizontal,
                  blankSpace: 20.0,
                  velocity: 70.0,
                  pauseAfterRound: const Duration(seconds: 0),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.linear,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
