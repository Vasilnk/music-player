// // Add songs to the database
// import 'package:hive/hive.dart';
// import 'package:play_tune/data%20base/model/db_model.dart';

// Future<void> addSongsToDataBase(List<SongDBModel> songs) async {
//   final box = Hive.box<SongDBModel>('songs');
//   await box.clear(); // Clear old entries
//   for (var song in songs) {
//     await box.add(song);
//   }
// }

// // Get all songs from the database
// List<SongDBModel> getAllSongs() {
//   final box = Hive.box<SongDBModel>('songs');
//   return box.values.toList();
// }

// 2

import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:play_tune/data%20base/model/db_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

// Load songs from phone and add to database
final OnAudioQuery audioQuery = OnAudioQuery();
Future<void> loadSongsFromPhone() async {
  final audioSongs = await audioQuery.querySongs();
  List<SongDBModel> songList = await Future.wait(audioSongs.map((song) async {
    print("song data is ${song.data}");
    final albumArt = await audioQuery.queryArtwork(song.id, ArtworkType.AUDIO);
    return SongDBModel(
      id: song.id,
      title: song.title,
      artist: song.artist ?? 'Unknown Artist',
      albumArt: albumArt ?? Uint8List(0),
      filePath: song.data,
    );
  }).toList());
  // Limit to 300 songs
  if (songList.length > 10) {
    songList = songList.sublist(0, 10);
  }
  await addSongsToDataBase(songList); // Store songs in Hive
  print(' audio songs ${audioSongs.length}');
  print('songlist songs ${songList.length}');
  audioSongs.clear();
  songList.clear();
  print('audio songs ${audioSongs.length}');
  print('songlist songs ${songList.length}');
}

// Get all songs from the database
List<SongDBModel> getAllSongs() {
  final box = Hive.box<SongDBModel>('songs');
  return box.values.toList();
}

Future<void> addSongsToDataBase(List<SongDBModel> songs) async {
  final box = Hive.box<SongDBModel>('songs');
  // await box.clear(); // Clear old entries
  if (box.isEmpty) {
    for (var song in songs) {
      await box.add(song);
    }
  }
  print('songs ${box.values.length}');
}
