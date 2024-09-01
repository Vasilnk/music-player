import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:play_tune/data%20base/function/db_function.dart';
import 'package:play_tune/data%20base/model/db_fav_model.dart';
import 'package:play_tune/screens/play_list/add_dialog.dart';

class ControlPortion extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final bool isPlaying;
  final VoidCallback togglePlayPause;
  final VoidCallback playNext;
  final VoidCallback playPrevious;
  final dynamic song;

  const ControlPortion({
    required this.audioPlayer,
    required this.isPlaying,
    required this.togglePlayPause,
    required this.playNext,
    required this.playPrevious,
    required this.song,
  });

  @override
  _ControlPortionState createState() => _ControlPortionState();
}

class _ControlPortionState extends State<ControlPortion> {
  bool isFavorite = false;
  bool isShuffling = false;
  bool isRepeating = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
    _listenToShuffleChanges();
    _listenToLoopModeChanges();
  }

  void checkIfFavorite() async {
    final isAlreadyFavorite =
        await isSongInFavorites(widget.song.id.toString());
    setState(() {
      isFavorite = isAlreadyFavorite;
    });
  }

  void _listenToShuffleChanges() {
    widget.audioPlayer.shuffleModeEnabledStream.listen((shuffleEnabled) {
      setState(() {
        isShuffling = shuffleEnabled;
      });
    });
  }

  void _listenToLoopModeChanges() {
    widget.audioPlayer.loopModeStream.listen((loopMode) {
      setState(() {
        isRepeating = loopMode == LoopMode.one;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite_sharp : Icons.favorite_border,
                color: isFavorite ? Color.fromARGB(255, 173, 34, 24) : null,
                size: 30,
              ),
              onPressed: () async {
                setState(() {
                  isFavorite = !isFavorite;
                  if (isFavorite) {
                    final favoriteSong = FavouriteDBModel(
                      id: widget.song.id.toString(),
                      title: widget.song.title,
                      artist: widget.song.artist ?? 'Unknown Artist',
                      filePath: widget.song.filePath,
                    );
                    addToFavorites(favoriteSong);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to favorites')),
                    );
                  } else {
                    removeFromFavorites(widget.song.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Removed from favorites')),
                    );
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.playlist_add, size: 30),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AddToPlaylistDialog(songId: widget.song.id),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 20),
        StreamBuilder<Duration>(
          stream: widget.audioPlayer.positionStream,
          builder: (context, snapshot) {
            final position = snapshot.data ?? Duration.zero;
            final duration = widget.audioPlayer.duration ?? Duration.zero;
            return Column(
              children: [
                Slider(
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    widget.audioPlayer.seek(Duration(seconds: value.toInt()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDuration(position)),
                      Text(_formatDuration(duration)),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isShuffling = !isShuffling;
                  widget.audioPlayer.setShuffleModeEnabled(isShuffling);
                  if (isShuffling) {
                    widget.audioPlayer.shuffle();
                  }
                });
              },
              icon: Icon(
                Icons.shuffle,
                size: 30,
                color: isShuffling ? Colors.blue : null,
              ),
            ),
            IconButton(
              icon: Icon(Icons.skip_previous, size: 50),
              onPressed: widget.playPrevious,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                icon: Icon(
                  widget.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                ),
                onPressed: widget.togglePlayPause,
              ),
            ),
            IconButton(
              icon: Icon(Icons.skip_next, size: 50),
              onPressed: widget.playNext,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isRepeating = !isRepeating;
                  widget.audioPlayer.setLoopMode(
                    isRepeating ? LoopMode.one : LoopMode.off,
                  );
                });
              },
              icon: Icon(
                Icons.repeat,
                size: 30,
                color: isRepeating ? Colors.blue : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
