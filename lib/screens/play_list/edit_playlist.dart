import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_tune/data%20base/model/db_playlist_model.dart';

class EditPlaylistDialog extends StatelessWidget {
  final PlayListModel playlist;
  final dynamic playlistKey;

  EditPlaylistDialog({required this.playlist, required this.playlistKey});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(text: playlist.name);

    return AlertDialog(
      title: Text('Edit Playlist Name'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(labelText: 'Playlist Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String newName = _controller.text.trim();
            if (newName.isNotEmpty) {
              Hive.box<PlayListModel>('playlists').put(
                  playlistKey,
                  PlayListModel(
                      name: newName, songIds: playlist.songIds, id: ''));
              Navigator.of(context).pop();
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
