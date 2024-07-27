// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:play_tune/screens/all_songs_screen.dart';
// import 'package:play_tune/screens/drower_screen.dart';
// import 'package:play_tune/screens/favorite_screen.dart';
// import 'package:play_tune/screens/play_list.dart';
// import 'package:play_tune/screens/recentlyplayed_screen.dart';

// class LandingScreen extends StatefulWidget {
//   @override
//   _LandingScreenState createState() => _LandingScreenState();
// }

// class _LandingScreenState extends State<LandingScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     checkPermission();
//   }

//   int _selectedIndex = 0;

//   static final List<Widget> _widgetOptions = [
//     RecentlyPlayedScreen(),
//     AllSongsScreen(),
//     FavoritesScreen(),
//     PlayListScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Future<void> checkPermission() async {
//     // Request storage permission
//     var status = await Permission.storage.request();

//     if (status.isGranted) {
//       print('permission granded');
//  loadSongsFromPhone();
//       // If permission is granted, navigate to AllSongsScreen
//     } else {
//       print('permission not granded');
//     }
//     // else if (status.isDenied) {
//     //   // If permission is denied, show a dialog to inform the user
//     //   showDialog(
//     //     context: context,
//     //     builder: (context) => AlertDialog(
//     //       title: Text('Permission Required'),
//     //       content: Text(
//     //           'Storage permission is required to access your music files.'),
//     //       actions: [
//     //         TextButton(
//     //           onPressed: () {
//     //             openAppSettings(); // Open app settings to grant permission manually
//     //           },
//     //           child: Text('Go to Settings'),
//     //         ),
//     //       ],
//     //     ),
//     //   );
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: DrawerScreen(),
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: ' Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.playlist_add_check),
//             label: 'Play List',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         onTap: _onItemTapped,
//         showUnselectedLabels: true,
//         unselectedItemColor: const Color.fromARGB(255, 146, 137, 137),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:play_tune/screens/all_songs_screen.dart';
import 'package:play_tune/screens/drower_screen.dart';
import 'package:play_tune/screens/favorite_screen.dart';
import 'package:play_tune/screens/play_list.dart';
import 'package:play_tune/screens/recentlyplayed_screen.dart';
import 'package:play_tune/data%20base/function/db_function.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    RecentlyPlayedScreen(),
    AllSongsScreen(), // Ensure this screen reads from the database
    FavoritesScreen(),
    PlayListScreen(),
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
      await loadSongsFromPhone();
    } else {
      print('Permission not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            label: 'Play List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: Color.fromARGB(255, 146, 137, 137),
      ),
    );
  }
}
