import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:play_tune/screens/all_songs/all_songs_screen.dart';
import 'package:play_tune/screens/drower/drower_screen.dart';
import 'package:play_tune/screens/favorite/favorite_screen.dart';
import 'package:play_tune/screens/home_screen/home_main.dart';
import 'package:play_tune/screens/play_list/play_list_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;
  bool fromeLandingScreen = true;
  static final List<Widget> _widgetOptions = [
    HomeScreen(),
    AllSongsScreen(true),
    FavoriteSongsScreen(),
    PlaylistsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  Future<void> checkPermission() async {
    var status = await Permission.storage.request();

    if (status.isGranted) {
      print('Permission granted');
    } else {
      print('Permission not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerScreen(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  backgroundColor: Color.fromARGB(255, 177, 75, 75),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  backgroundColor: Color.fromARGB(255, 177, 75, 75),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded),
                  backgroundColor: Color.fromARGB(255, 177, 75, 75),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.playlist_add_check),
                  backgroundColor: Color.fromARGB(255, 177, 75, 75),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Color.fromARGB(255, 146, 137, 137),
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}
