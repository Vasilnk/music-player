import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:play_tune/data%20base/model/db_fav_model.dart';
import 'package:play_tune/data%20base/model/db_model.dart';
import 'package:play_tune/data%20base/model/db_mostly_model.dart';
import 'package:play_tune/data%20base/model/db_recent_model.dart';
import 'package:play_tune/utils/trim_name.dart';

final OnAudioQuery audioQuery = OnAudioQuery();

Future<List<SongDBModel>> loadSongs() async {
  List<SongDBModel> songs = [];

  final List<SongModel> fetchedSongs = await audioQuery.querySongs(
    sortType: SongSortType.ALBUM,
    orderType: OrderType.ASC_OR_SMALLER,
    uriType: UriType.EXTERNAL,
  );

  final songBox = Hive.box<SongDBModel>('songs');
  songs = fetchedSongs.map((song) {
    final title = truncate(trimFileExtension(song.displayName), 20);
    final artist = truncate(song.artist ?? 'Unknown Artist', 20);

    final songModel = SongDBModel(
      id: song.id.toString(),
      title: title,
      artist: artist,
      filePath: song.uri!,
    );
    songBox.put(song.id.toString(), songModel);
    return songModel;
  }).toList();

  return songs;
}

Future<void> addToFavorites(FavouriteDBModel favsong) async {
  final FavBox = await Hive.box<FavouriteDBModel>('favorites');
  FavBox.put(favsong.id, favsong);
}

Future<bool> isSongInFavorites(String songId) async {
  final box = await Hive.openBox<FavouriteDBModel>('favorites');
  return box.containsKey(songId);
}

Future<void> removeFromFavorites(String id) async {
  final FavBox = await Hive.box<FavouriteDBModel>('favorites');
  FavBox.delete(id);
}

ValueListenable<Box<FavouriteDBModel>> getFavoritesListenable() {
  return Hive.box<FavouriteDBModel>('favorites').listenable();
}

Future<void> addToRecentPlayed(RecentDBModel recentSong) async {
  final recentBox = await Hive.box<RecentDBModel>('recent');

  for (int i = 0; i < recentBox.length; i++) {
    final song = recentBox.getAt(i);
    if (song?.id == recentSong.id) {
      recentBox.deleteAt(i);
      break;
    }
  }

  await recentBox.add(recentSong);

  final songs = recentBox.values.toList();
  songs.insert(0, songs.removeLast());

  if (songs.length > 10) {
    songs.removeLast();
  }

  await recentBox.clear();
  await recentBox.addAll(songs);
}

ValueListenable<Box<RecentDBModel>> getrecentListenable() {
  return Hive.box<RecentDBModel>('recent').listenable();
}

// mostly
class SongPlayCounter {
  Map<String, int> _playCounts = {};

  void incrementPlayCount(String filePath) {
    _playCounts[filePath] = (_playCounts[filePath] ?? 0) + 1;
  }

  int getPlayCount(String filePath) {
    return _playCounts[filePath] ?? 0;
  }
}

final songCounter = SongPlayCounter();

void mostlyFunction(String filePath, song) async {
  songCounter.incrementPlayCount(filePath);

  if (songCounter.getPlayCount(filePath) >= 3) {
    final mostlySong = MostlyPlayedModel(
      id: song.id.toString(),
      title: song.title,
      artist: song.artist ?? 'Unknown Artist',
      filePath: song.filePath,
    );
    final mostlyBox = await Hive.box<MostlyPlayedModel>('mostly');
    mostlyBox.put(mostlySong.id, mostlySong);
  }
}

//remove from playlist
Future<void> removeFromPlaylist(String id) async {
  final Box = await Hive.box<SongDBModel>('songs');
  Box.delete(id);
}
