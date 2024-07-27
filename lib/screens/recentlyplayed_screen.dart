// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/costom_widgets/list_tile.dart';
import 'package:play_tune/screens/drower_screen.dart';
import 'package:play_tune/utils/label.dart';

class RecentlyPlayedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final List<String> dummySongs = [
      "Blinding Lights",
      "Shape of You",
      "Rolling in th",
      "Bohemian Rhapsody",
      "Perfect"
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      appBar: CustomAppBar(title: 'Music Player', scaffoldKey: _scaffoldKey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              StringLabels.recentlyPlayed,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: dummySongs.isEmpty
                  ? Text('You have not played any music recently')
                  : ListView.builder(
                      itemCount: dummySongs.length,
                      itemBuilder: (context, index) {
                        // return SongListTile(
                        //   songTitle: dummySongs[index],
                        //   imageForTile: 'assets/images/images_logo.png',
                        //   artist: 'singer ${index + 1}',
                        //   filePath: song.filePath,

                        // );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
