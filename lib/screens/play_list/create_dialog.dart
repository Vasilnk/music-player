import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_tune/data%20base/model/db_playlist_model.dart';

class CreatePlaylistDialog extends StatefulWidget {
  @override
  _CreatePlaylistDialogState createState() => _CreatePlaylistDialogState();
}

class _CreatePlaylistDialogState extends State<CreatePlaylistDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Playlist'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Playlist Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            final name = _controller.text;
            if (name.isNotEmpty) {
              final playlist = PlayListModel(
                id: DateTime.now().toString(),
                name: name,
                songIds: [],
              );
              Hive.box<PlayListModel>('playlists').add(playlist);
              Navigator.pop(context);
            }
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}
