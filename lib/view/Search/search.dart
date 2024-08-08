import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/player/player_bloc.dart';
import '../../utils/topbar.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: TopBar(
            title: Expanded(
              child: SearchBar(
                  controller: searchController,
                  leading: const Icon(Icons.search),
                  hintText: "What Do You Want to Listen?",
                  onChanged: (value) {
                    context.read<PlayerBloc>().add(SearchSong(query: value));
                  },
                  trailing: [
                    Visibility(
                      visible: searchController.text.isNotEmpty,
                      child: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          searchController.clear();
                          context
                              .read<PlayerBloc>()
                              .add(const SearchSong(query: ""));
                        },
                      ),
                    ),
                  ]),
            ),
          ),
          body: SafeArea(
            child: Stack(children: [
              (searchController.text.isEmpty)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Play what you love",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "Search for song",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.searchList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: ListTile(
                            leading: state.searchList[index].artwork != null
                                ? Image.memory(
                                    state.searchList[index].artwork!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  )
                                : const Icon(Icons.music_note, size: 50),
                            title: Text(
                              state.searchList[index].songName,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            subtitle: Text(
                              state.searchList[index].artists ?? "",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            onTap: () {
                              context.pushNamed(
                                'Player',
                                extra: {
                                  'songModel': state.searchList[index],
                                  'playingList': "",
                                },
                              );
                            },
                          ),
                        );
                      }),
            ]),
          ),
        );
      },
    );
  }
}
