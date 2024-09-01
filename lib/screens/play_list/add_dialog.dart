import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_tune/data%20base/model/db_playlist_model.dart';

class AddToPlaylistDialog extends StatefulWidget {
  final String songId;

  AddToPlaylistDialog({required this.songId});

  @override
  _AddToPlaylistDialogState createState() => _AddToPlaylistDialogState();
}

class _AddToPlaylistDialogState extends State<AddToPlaylistDialog> {
  bool _isCreating = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromARGB(255, 219, 217, 217),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add to Playlist',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 16),
              if (_isCreating) ...[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter playlist name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isCreating = false;
                          _controller.clear();
                        });
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        final name = _controller.text.trim();
                        if (name.isNotEmpty) {
                          final playlist = PlayListModel(
                            id: DateTime.now().toString(),
                            name: name,
                            songIds: [],
                          );
                          Hive.box<PlayListModel>('playlists').add(playlist);

                          setState(() {
                            _isCreating = false;
                            _controller.clear();
                          });
                        }
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ] else ...[
                ValueListenableBuilder(
                  valueListenable:
                      Hive.box<PlayListModel>('playlists').listenable(),
                  builder: (context, Box<PlayListModel> box, _) {
                    final playlists = box.values.toList();

                    return Column(
                      children: [
                        if (playlists.isNotEmpty)
                          SizedBox(
                            height: playlists.length > 5
                                ? 200
                                : playlists.length * 50.0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: playlists.length,
                              itemBuilder: (context, index) {
                                final playlist = playlists[index];
                                return ListTile(
                                  leading: const Icon(Icons.playlist_add,
                                      color: Color.fromARGB(255, 139, 73, 73)),
                                  title: Text(
                                    playlist.name,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    final key = box.keyAt(index);
                                    playlist.songIds.add(widget.songId);
                                    box.put(key, playlist);

                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Added to ${playlist.name}'),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        const Divider(),
                        ListTile(
                          leading:
                              const Icon(Icons.add, color: Colors.deepPurple),
                          title: const Text(
                            'Create Playlist',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _isCreating = true;
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
