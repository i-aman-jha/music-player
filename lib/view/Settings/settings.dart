import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/utils/topbar.dart';

import '../../bloc/app/app_bloc.dart';
import '../../utils/icon_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: MyIconButton(
          icon: Icons.arrow_back_ios_new,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Theme",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                RadioListTile(
                  title: Text(
                    "System",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: ThemeMode.system,
                  groupValue: state.theme,
                  onChanged: (value) {
                    context.read<AppBloc>().add(UpdateTheme(theme: value));
                  },
                ),
                RadioListTile(
                  title: Text(
                    "Dark",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: ThemeMode.dark,
                  groupValue: state.theme,
                  onChanged: (value) {
                    context.read<AppBloc>().add(UpdateTheme(theme: value));
                  },
                ),
                RadioListTile(
                  title: Text(
                    "Light",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: ThemeMode.light,
                  groupValue: state.theme,
                  onChanged: (value) {
                    context.read<AppBloc>().add(UpdateTheme(theme: value));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
