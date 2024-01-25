import 'package:flutter/material.dart';
import 'package:tabernarium/widgets/Containers/home_game.dart';
import 'package:tabernarium/widgets/Containers/taberna_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0), // Adjust the height as needed
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Descubrir'),
              Tab(text: 'Generos'),
              Tab(text: 'Noticias'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          DiscoverTab(),
          GenresTab(),
          NewsTab(),
        ],
      ),
    );
  }
}

// Import necessary packages and widgets

class DiscoverTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Partidas',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HomeGameContainer(
                      creator: Icons.person,
                      game: 'Cthulhu',
                      title: 'Las mascaras',
                      description: 'Pegarse de leches con pulpos',
                      members: '5'),
                  SizedBox(
                    width: 10.0,
                  ),
                  HomeGameContainer(
                      creator: Icons.person,
                      game: 'Cthulhu',
                      title: 'Las mascaras',
                      description: 'Pegarse de leches con pulpos',
                      members: '5')
                ],
              )),
              SizedBox(height: 10.0),
              const Center(
            child: Text(
              'Tabernas',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.0),
          Column(children: [
            TabernaContainer(
              groupName: 'R.I.P', 
              numberOfMembers: '40', 
              groupImage: 'assets/d20.png', 
              onPressed: (){}),
              SizedBox(height: 10.0,),
              TabernaContainer(
              groupName: 'R.I.P', 
              numberOfMembers: '40', 
              groupImage: 'assets/d20.png', 
              onPressed: (){})
          ],)
        ],
      ),
    ));
  }
}

class GenresTab extends StatelessWidget {
  const GenresTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // List of roleplay genres
        ],
      ),
    );
  }
}

class NewsTab extends StatelessWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // News from the Tabernas
        ],
      ),
    );
  }
}
