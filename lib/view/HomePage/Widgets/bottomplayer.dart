import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import '../../../bloc/player/player_bloc.dart';
import '../../../models/MySongModel/song_model.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({
    super.key,
  });

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          MySongModel? songModel = state.songModel;
          final duration = state.duration ?? Duration.zero;
          final position = state.position ?? Duration.zero;
          final progress = (duration.inMilliseconds == 0)
              ? 0.0
              : (position.inMilliseconds / duration.inMilliseconds)
                  .clamp(0.0, 1.0);

          return GestureDetector(
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dx < 0) {
                // Right swipe
                context.read<PlayerBloc>().add(Next());
              } else if (details.velocity.pixelsPerSecond.dx > 0) {
                // Left swipe
                context.read<PlayerBloc>().add(Previous());
              }
            },
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                // Downward drag
                context.read<PlayerBloc>().add(CloseBottomPlayer());
              } else if (details.delta.dy < 0) {
                // context.pushNamed(
                //   'Player',
                //   extra: {
                //     'songModel': state.songModel,
                //     'playEvent': false,
                //   },
                // );
              }
            },
            onTap: () {
              context.pushNamed(
                'Player',
                extra: {
                  'songModel': state.songModel,
                  'playEvent': false,
                },
              );
            },
            child: Visibility(
              visible: state.bottomPlayer,
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: (Theme.of(context).brightness == Brightness.dark)
                          ? Colors.black12.withOpacity(0.6)
                          : Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: const Offset(0, 3), //Offset(horizontal, vertical)
                    )
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? Colors.black
                      : const Color.fromRGBO(232, 231, 231, 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 1.5),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            // Use ClipRRect to clip the image to the container's shape
                            borderRadius: BorderRadius.circular(5),
                            // Optional: Add rounded corners
                            child: (songModel != null)
                                ? (songModel.artwork != null)
                                    ? Image.memory(
                                        songModel.artwork!,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      )
                                    : Container(
                                        height: 50,
                                        width: 50,
                                        color: (Theme.of(context).brightness ==
                                                Brightness.dark)
                                            ? Colors.white
                                            : Colors.black,
                                        child: const Icon(
                                          Icons.music_note,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (songModel != null) ? songModel.songName : "",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.63,
                              height: 30,
                              child: Marquee(
                                text: (state.songModel != null)
                                    ? state.songModel!.artists ?? "Unknown"
                                    : "Unknown",
                                style: Theme.of(context).textTheme.bodyMedium,
                                scrollAxis: Axis.horizontal,
                                blankSpace: 20.0,
                                velocity: 70.0,
                                pauseAfterRound: const Duration(seconds: 0),
                                startPadding: 10.0,
                                accelerationDuration:
                                    const Duration(seconds: 1),
                                accelerationCurve: Curves.linear,
                                decelerationDuration:
                                    const Duration(milliseconds: 500),
                                decelerationCurve: Curves.linear,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        IconButton(
                          onPressed: () {
                            (state.isPlaying)
                                ? context.read<PlayerBloc>().add(Pause())
                                : context.read<PlayerBloc>().add(Resume());
                          },
                          icon: Icon(
                            state.isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 1.5,
                        width:
                            MediaQuery.of(context).size.width * 0.95 * progress,
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black,
                      ),
                    )
                  ],
                ),
                // : const CircularProgressIndicator();
              ),
            ),
          );
        },
      ),
    );
  }
}
