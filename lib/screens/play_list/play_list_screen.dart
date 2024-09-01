import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/data%20base/model/db_playlist_model.dart';
import 'package:play_tune/screens/play_list/create_dialog.dart';
import 'package:play_tune/screens/play_list/edit_playlist.dart';
import 'package:play_tune/screens/play_list/playlist_songs.dart';

class PlaylistsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Play Lists',
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
                      color: Color.fromARGB(255, 175, 108, 114),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      playlist.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 207, 178, 178),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              Future.microtask(() {
                                showDialog(
                                  context: context,
                                  builder: (context) => EditPlaylistDialog(
                                    playlist: playlist,
                                    playlistKey: key,
                                  ),
                                );
                              });
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                const SizedBox(width: 8),
                                Text('Edit Playlist'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.delete),
                                const SizedBox(width: 8),
                                Text('Delete playlist'),
                              ],
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor:
                                      Color.fromARGB(255, 228, 223, 223),
                                  title: Text(
                                    'Delete Playlist',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 74, 68, 136)),
                                  ),
                                  content: Text(
                                      'Are you sure you want to delete this playlist?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        box.delete(key);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ];
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
