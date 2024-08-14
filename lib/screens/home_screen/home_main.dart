import 'package:flutter/material.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/screens/drower/drower_screen.dart';
import 'package:play_tune/screens/home_screen/grid_items.dart';
import 'package:play_tune/screens/home_screen/recent_songs.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerScreen(),
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: 'Music Player',
        scaffoldKey: _scaffoldKey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeGridItems(),
          RecentSongs(),
        ],
      ),
    );
  }
}
