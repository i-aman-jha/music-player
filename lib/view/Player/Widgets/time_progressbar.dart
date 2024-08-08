import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/player/player_bloc.dart';

class TimeProgBar extends StatefulWidget {
  final double timeProgress;

  const TimeProgBar({
    super.key,
    required this.timeProgress,
  });

  @override
  State<TimeProgBar> createState() => _TimeProgBarState();
}

class _TimeProgBarState extends State<TimeProgBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final duration = state.duration ?? Duration.zero;
        final position = state.position ?? Duration.zero;
        final progress = (duration.inMilliseconds == 0)
            ? 0.0
            : (position.inMilliseconds / duration.inMilliseconds)
                .clamp(0.0, 1.0);
        return Column(
          children: [
            Slider(
              value: progress,
              onChanged: (value) {
                var pos = duration.inMilliseconds * value;
                context.read<PlayerBloc>().add(Seek(position: pos));
              },
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Text(_formatDuration(position)),
                const Expanded(child: SizedBox()),
                Text(_formatDuration(duration)),
                // Text(state.duration.toString()),
                const SizedBox(width: 15),
              ],
            ),
          ],
        );
      },
    );
  }
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$minutes:$seconds";
}
