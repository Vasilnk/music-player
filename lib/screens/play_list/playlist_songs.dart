import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/costom_widgets/list_tile.dart';
import 'package:play_tune/data%20base/model/db_model.dart';
import 'package:play_tune/data%20base/model/db_playlist_model.dart';

class PlaylistSongs extends StatelessWidget {
  final PlayListModel playlist;

  PlaylistSongs({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: playlist.name),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<SongDBModel>('songs').listenable(),
        builder: (context, Box<SongDBModel> box, _) {
          final songs = box.values
              .where((song) => playlist.songIds.contains(song.id))
              .toList();

          if (songs.isEmpty) {
            return Center(child: Text('No songs in this playlist'));
          }

          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return SongListTile(
                song: song,
                context: context,
                songs: songs,
                index: index,
                // isfavorite: false,
              );
            },
          );
        },
      ),
    );
  }
}
