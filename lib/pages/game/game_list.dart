import 'package:flutter/material.dart';
import 'package:tabernarium/widgets/Containers/game_container.dart';
import 'package:tabernarium/widgets/Extra/search_bar.dart';
import 'package:tabernarium/theme/theme.dart';
import 'package:provider/provider.dart';

class GameListPage extends StatefulWidget {
  final VoidCallback createGame;
  const GameListPage({super.key, required this.createGame});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: CustomSearchBar(
                      controller: searchController,
                      onSubmitted: (query) {
                        print("Search submitted: $query");
                      }),
                )
              ]),
              SizedBox(height: 10.0),
              Text(
                'Partidas',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10.0),
              GameAccordion(
                  title: 'Los hijos de Nyarlathotep',
                  creator: Icons.person,
                  players: '6/9',
                  gameName: 'Call of Cthulhu',
                  description: 'Una gran partida para pegarse con pulpos')
            ],
          ),
        )
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.createGame(),
        backgroundColor: actualTheme.colorScheme.onSurface,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}
