import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongInfo extends StatelessWidget {
  final song;

  const SongInfo({required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 270,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: QueryArtworkWidget(
              id: int.parse(song.id),
              type: ArtworkType.AUDIO,
              artworkBorder: BorderRadius.circular(10),
              nullArtworkWidget: Icon(
                Icons.music_note,
                size: 200,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(song.title, style: TextStyle(fontSize: 24)),
          Text(song.artist == '<unknown>' ? 'Unknown Artist' : song.artist,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              )),
        ],
      ),
    );
  }
}
