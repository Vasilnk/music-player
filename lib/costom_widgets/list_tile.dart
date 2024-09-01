import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:play_tune/costom_widgets/popUp.dart';
import 'package:play_tune/screens/now_playing/main_part.dart';

class SongListTile extends StatelessWidget {
  final dynamic song;
  final BuildContext context;
  final List<dynamic> songs;
  final int index;
  final dynamic FavouriteSongs;
  final playlist;
  const SongListTile(
      {Key? key,
      required this.song,
      required this.context,
      required this.songs,
      required this.index,
      this.FavouriteSongs,
      this.playlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        trailing: PopUp(song: song, playlist: playlist),
        onTap: () async {
          FocusScope.of(context).unfocus();

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
    );
  }
}
