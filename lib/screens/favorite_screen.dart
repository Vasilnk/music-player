import 'package:flutter/material.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/screens/drower_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        // key: _scaffoldKey,
        drawer: DrawerScreen(),
        appBar: CustomAppBar(
          title: '          Favorites ',
          // scaffoldKey: _scaffoldKey,
          // onSearch: () {},
        ),
        body: Center(child: Text('This future not added')));
  }
}
