import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music/Repository/SongRepo/song_repository.dart';
import 'package:music/configs/routes/routes.dart';
import 'package:music/configs/theme/dark_theme.dart';
import 'package:music/configs/theme/light_theme.dart';
import 'Services/playlist_service.dart';
import 'Services/theme_service.dart';
import 'bloc/app/app_bloc.dart';
import 'bloc/player/player_bloc.dart';
import 'models/MySongModel/song_model.dart';
import 'models/PlaylistModel/playlist_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MySongModelAdapter());
  Hive.registerAdapter(MyPlaylistModelAdapter());
  var playlistBox = await Hive.openBox<MyPlaylistModel>('playlists');
  var settingsBox = await Hive.openBox('settings');
  runApp(MyApp(
    playlistBox: playlistBox,
    settingsBox: settingsBox,
  ));
}

class MyApp extends StatefulWidget {
  final Box<MyPlaylistModel> playlistBox;
  final Box<dynamic> settingsBox;

  const MyApp({
    super.key,
    required this.playlistBox,
    required this.settingsBox,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final playlistService = PlaylistService(widget.playlistBox);
    final songRepository = SongRepository();
    final themeService = ThemeService(widget.settingsBox);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PlayerBloc(songRepository, playlistService)..add(GetSongsList()),
        ),
        BlocProvider(
          create: (context) => AppBloc(themeService)..add(GetTheme()),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: state.theme,
            theme: lightTheme,
            darkTheme: darkTheme,
            routerConfig: AppNavigation.router,
          );
        },
      ),
    );
  }
}
