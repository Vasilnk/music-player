import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/data%20base/model/db_fav_model.dart';
import 'package:play_tune/costom_widgets/list_tile.dart';

class FavoriteSongsScreen extends StatefulWidget {
  @override
  _FavoriteSongsScreenState createState() => _FavoriteSongsScreenState();
}

class _FavoriteSongsScreenState extends State<FavoriteSongsScreen> {
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Favorite Songs',
        ),
        body: ValueListenableBuilder(
            valueListenable:
                Hive.box<FavouriteDBModel>('favorites').listenable(),
            builder: (context, Box<FavouriteDBModel> box, w) {
              final favoriteSongs = box.values.toList();
              if (favoriteSongs.isEmpty) {
                return Center(child: Text('No favorite songs yet'));
              }
              return ListView.builder(
                itemCount: favoriteSongs.length,
                itemBuilder: (context, index) {
                  final song = favoriteSongs[index];
                  return SongListTile(
                    context: context,
                    index: index,
                    song: song,
                    songs: favoriteSongs,
                    // isfavorite: isFavorite,
                  );
                },
              );
            }));
  }
}
