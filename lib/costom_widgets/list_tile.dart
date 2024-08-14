import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:play_tune/costom_widgets/popUp.dart';
import 'package:play_tune/data%20base/function/db_function.dart';
import 'package:play_tune/data%20base/model/db_recent_model.dart';
import 'package:play_tune/screens/now_playing/main_part.dart';

class SongListTile extends StatelessWidget {
  final dynamic song;
  final BuildContext context;
  final List<dynamic> songs;
  final int index;
  // final bool? isFavorite;
  final dynamic FavouriteSongs; // Adjust the type as needed

  const SongListTile({
    Key? key,
    required this.song,
    required this.context,
    required this.songs,
    required this.index,
    // this.isFavorite,
    this.FavouriteSongs,
    // required bool isfavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
            child: QueryArtworkWidget(
              id: int.parse(song.id),
              type: ArtworkType.AUDIO,
              nullArtworkWidget: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/images/musicnoteImage.jpg'),
              ),
            ),
          ),
          title: Text(song.title),
          subtitle: Text(song.artist),
          trailing: PopUp(song: song),
          onTap: () async {
            FocusScope.of(context).unfocus();
            final recentSong = RecentDBModel(
              id: song.id.toString(),
              title: song.title,
              artist: song.artist ?? 'Unknown Artist',
              filePath: song.filePath,
            );
            addToRecentPlayed(recentSong);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NowPlayingScreen(
                  songs: songs,
                  initialIndex: index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
