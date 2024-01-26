import 'package:flutter/material.dart';
import 'package:tabernarium/pages/chat/chatroom.dart';
import 'package:tabernarium/pages/game/game_creation.dart';
import 'package:tabernarium/pages/game/game_list.dart';
import 'package:tabernarium/pages/home/home.dart';
import 'package:tabernarium/pages/user/group_profile.dart';
import 'package:tabernarium/pages/user/user_profile.dart';
import 'package:tabernarium/theme/theme.dart';
import 'package:provider/provider.dart';

class NexusPage extends StatefulWidget {
  const NexusPage({super.key});

  @override
  State<NexusPage> createState() => _NexusPageState();
}

class _NexusPageState extends State<NexusPage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    //Here you have all the main screens which will react when touching the buttons
    //on the Appbar and the BottomNavBar
    final List<Widget> screens = [
      const ChatRoom(),
      GameListPage(createGame: () {
        setState(() {
          _selectedIndex = 5;
        });
      }),
      const HomeScreen(),
      const GroupProfilePage(),
      const UserProfilePage(),
      const GameCreationPage()
    ];
    //This controls the theme
    //final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return ScaffoldMessenger(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      //###################### AppBar ##########################
      appBar: AppBar(
        backgroundColor: actualTheme.colorScheme.surface,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/TabernariumLogo.png',
              width: 50.0,
            ),
            Image.asset(
              'assets/TabernariumTitle.png',
              width: 150.0,
            )
          ],
        ),
      ),
      //###################### Body ##########################
      body: screens[
          _selectedIndex], //Every time you touch a buttom, this index changes, only changing the body
      //###################### Bottom Nav Bar ##########################
      bottomNavigationBar: BottomAppBar(
        color: actualTheme.colorScheme.onBackground,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        shadowColor: actualTheme.colorScheme.onSurface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                icon: const ImageIcon(
                  AssetImage('assets/beer.png'),
                  color: Colors.white,
                  size: 30,
                )),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/crossed_swords.png'),
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  icon: const ImageIcon(
                    AssetImage('assets/crown.png'),
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            const SizedBox(width: 5),
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
                icon: const ImageIcon(
                  AssetImage('assets/dragon.png'),
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Boom, here you have a bottomnavbar with the centered buttom!!
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        backgroundColor: actualTheme.colorScheme.surface,
        elevation: 5,
        shape: const CircleBorder(),
        child: const ImageIcon(
          AssetImage('assets/d20.png'),
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  void _navigateToScreen(String route) {
    Navigator.pushNamed(context, route);
  }
}
