import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music/Services/splash.dart';
import 'package:music/view/About/about.dart';
import 'package:music/view/Settings/settings.dart';
import 'package:music/view/main_page.dart';
import 'package:music/view/Player/player.dart';
import 'package:music/view/Playlist/playlist.dart';
import 'package:music/view/Search/search.dart';
import 'package:music/view/Library/library.dart';
import 'package:music/view/HomePage/song_page.dart';

import '../../view/Contact/contact.dart';

class AppNavigation {
  AppNavigation.context();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorSearch =
      GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
  static final _shellNavigatorLibrary =
      GlobalKey<NavigatorState>(debugLabel: 'shellLibrary');

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) {
                  return const SongListPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSearch,
            routes: <RouteBase>[
              GoRoute(
                path: "/search",
                name: "Search",
                builder: (BuildContext context, GoRouterState state) {
                  return const Search();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorLibrary,
            routes: <RouteBase>[
              GoRoute(
                path: "/library",
                name: "Library",
                builder: (BuildContext context, GoRouterState state) {
                  return const Library();
                },
                routes: [
                  GoRoute(
                    path: 'playlist',
                    name: 'Playlist',
                    pageBuilder: (context, state) {
                      final name = state.extra! as String;
                      return _slideTransitionRoute(
                        Playlist(
                          playlistName: name,
                        ),
                        const Offset(1.0, 0.0),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/splash',
        name: "Splash",
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/player',
        name: "Player",
        pageBuilder: (context, state) {
          // final songModel = state.extra! as MySongModel;
          final extra = state.extra! as Map<String, dynamic>;
          return _slideTransitionRoute(
            Player(
              key: state.pageKey,
              songModel: extra['songModel'],
              playingList: extra['playingList'],
              playEvent: extra['playEvent'] ?? true,
            ),
            const Offset(0.0, 1.0),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/settings',
        name: "Settings",
        pageBuilder: (context, state) {
          return _slideTransitionRoute(
            SettingsPage(
              key: state.pageKey,
            ),
            const Offset(-1.0, 0.0),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/contact',
        name: "Contact",
        pageBuilder: (context, state) {
          return _slideTransitionRoute(
            ContactPage(
              key: state.pageKey,
            ),
            const Offset(-1.0, 0.0),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/about',
        name: "About",
        pageBuilder: (context, state) {
          return _slideTransitionRoute(
            AboutPage(
              key: state.pageKey,
            ),
            const Offset(-1.0, 0.0),
          );
        },
      ),
    ],
  );
}

CustomTransitionPage _slideTransitionRoute(Widget screen, Offset begin) {
  return CustomTransitionPage<void>(
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const end = Offset(0.0, 0.0);
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
