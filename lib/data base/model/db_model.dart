import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 0)
class SongDBModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String artist;

  @HiveField(3)
  final String filePath;

  SongDBModel(
      {required this.id,
      required this.title,
      required this.artist,
      required this.filePath});
}
