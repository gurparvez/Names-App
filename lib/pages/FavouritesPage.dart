import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/main.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favourites.isEmpty) {
      return const Center(
        child: Text("No Favourites yet!"),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("You have ${appState.favourites.length} favourites"),
        ),
        for (WordPair pair in appState.favourites)
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                appState.toggleFavourite(pair);
              },
            ),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
