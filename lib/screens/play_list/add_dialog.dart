import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_tune/data%20base/model/db_playlist_model.dart';

class AddToPlaylistDialog extends StatelessWidget {
  final String songId;

  AddToPlaylistDialog({required this.songId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add to Playlist'),
      content: ValueListenableBuilder(
        valueListenable: Hive.box<PlayListModel>('playlists').listenable(),
        builder: (context, Box<PlayListModel> box, _) {
          final playlists = box.values.toList();
          if (playlists.isEmpty) {
            return SizedBox(
              height: 100,
              child: Center(child: Text('No playlists available')),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return ListTile(
                title: Text(playlist.name),
                onTap: () {
                  final key = box.keyAt(index);
                  playlist.songIds.add(songId);
                  box.put(key, playlist);

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to ${playlist.name}')),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
