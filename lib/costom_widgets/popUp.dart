import 'package:flutter/material.dart';
import 'package:play_tune/data%20base/function/db_function.dart';
import 'package:play_tune/data%20base/model/db_fav_model.dart';
import 'package:play_tune/screens/play_list/add_dialog.dart';

class PopUp extends StatefulWidget {
  final dynamic song;

  const PopUp({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  void checkIfFavorite() async {
    final isAlreadyFavorite =
        await isSongInFavorites(widget.song.id.toString());
    setState(() {
      isFavorite = isAlreadyFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: const Color.fromARGB(255, 202, 174, 174),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              Future.microtask(() async {
                if (isFavorite) {
                  await removeFromFavorites(widget.song.id);
                  setState(() {
                    isFavorite = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Removed from favorites'),
                    ),
                  );
                } else {
                  final favoriteSong = FavouriteDBModel(
                    id: widget.song.id.toString(),
                    title: widget.song.title,
                    artist: widget.song.artist ?? 'Unknown Artist',
                    filePath: widget.song.filePath,
                  );
                  await addToFavorites(favoriteSong);
                  setState(() {
                    isFavorite = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to favorites'),
                    ),
                  );
                }
              });
            },
            child: Row(
              children: [
                Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                const SizedBox(width: 8),
                Text(isFavorite ? 'Remove from favorite' : 'Add to favorite'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                const Icon(Icons.playlist_add_sharp),
                const SizedBox(width: 8),
                const Text('Add to playlist'),
              ],
            ),
            onTap: () {
              Future.microtask(() {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AddToPlaylistDialog(songId: widget.song.id),
                );
              });
            },
          ),
        ];
      },
    );
  }
}
