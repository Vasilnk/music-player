import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:play_tune/costom_widgets/appbar.dart';

import 'package:play_tune/data%20base/model/db_playlist_model.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_tune/screens/play_list/create_dialog.dart';
import 'package:play_tune/screens/play_list/playlist_songs.dart';

class PlaylistsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Playlists',
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<PlayListModel>('playlists').listenable(),
        builder: (context, Box<PlayListModel> box, _) {
          final playlists = box.values.toList();
          if (playlists.isEmpty) {
            return Center(child: Text('No playlists yet'));
          }
          return ListView.builder(
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              final key = box.keyAt(index);
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 231, 230),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      playlist.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Delete Playlist'),
                            content: Text(
                                'Are you sure you want to delete this playlist?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Delete the playlist from Hive
                                  box.delete(key);
                                  Navigator.of(context).pop(); // Close dialog
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                    leading: Icon(Icons.playlist_play_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaylistSongs(playlist: playlist),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CreatePlaylistDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
