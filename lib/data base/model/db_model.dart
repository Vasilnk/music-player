import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class SongDBModel {
  @HiveField(0)
  final int id; // Unique identifier for the song

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String artist;

  @HiveField(3)
  final Uint8List albumArt; // Path to album art image file

  @HiveField(4)
  final String filePath; // Path to the song file

  SongDBModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.filePath,
  });
}
