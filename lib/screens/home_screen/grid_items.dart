import 'package:flutter/material.dart';
import 'package:play_tune/screens/all_songs/all_songs_screen.dart';
import 'package:play_tune/screens/favorite/favorite_screen.dart';
import 'package:play_tune/screens/mostly/mostlyplayed_screen.dart';
import 'package:play_tune/screens/play_list/play_list_screen.dart';
import 'package:play_tune/utils/color.dart';

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
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
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
                      color: Colors.black,
                    ),
                  ),
                ),
                decoration: bgTheme1(Color.fromARGB(255, 235, 235, 235)),
              ),
            ),
          ),
        );
      },
    );
  }
}
