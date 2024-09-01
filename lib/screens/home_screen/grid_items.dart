import 'package:flutter/material.dart';
import 'package:play_tune/screens/all_songs/all_songs_screen.dart';
import 'package:play_tune/screens/favorite/favorite_screen.dart';
import 'package:play_tune/screens/mostly/mostlyplayed_screen.dart';
import 'package:play_tune/screens/play_list/play_list_screen.dart';

class HomeGridItems extends StatelessWidget {
  HomeGridItems({super.key});
  final List<String> names = [
    'All Songs',
    'Favourite Songs',
    'Mostly Played',
    'PlayList'
  ];

  final List<Widget> screens = [
    AllSongsScreen(false),
    FavoriteSongsScreen(),
    MostlyPlayedScreen(),
    PlaylistsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => screens[index],
                  ),
                );
              },
              child: GridTile(
                child: Container(
                    child: Center(
                      child: Text(
                        names[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 156, 48, 48),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          );
        },
      ),
    );
  }
}
