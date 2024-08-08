import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/player/player_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Image(
              image: AssetImage('assets/icon/icon.png'),
            ),
            title: Text(
              "Music App",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<PlayerBloc, PlayerState>(
            builder: (context, state) {
              final keys = state.library.keys.toList();
              final values = state.library.values.toList();
              return ExpansionTile(
                childrenPadding: const EdgeInsets.only(left: 35),
                title: Row(
                  children: [
                    const Icon(Icons.library_music),
                    const SizedBox(width: 15),
                    Text(
                      "Library",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                children: [
                  ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.library.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.library_books),
                          title: Text(
                            keys[index],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            "${values[index].length} Tracks",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          onTap: () {
                            context.pushNamed(
                              'Playlist',
                              extra: keys[index],
                            );
                          },
                        );
                      }),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              context.pushNamed("Settings");
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: Text(
              "Contact Me",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              context.pushNamed("Contact");
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(
              "About",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              context.pushNamed("About");
            },
          ),
        ],
      ),
    );
  }
}
