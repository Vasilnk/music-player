import 'package:hive/hive.dart';
part 'db_mostly_model.g.dart';

@HiveType(typeId: 4)
class MostlyPlayedModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String artist;

  @HiveField(3)
  final String filePath;
  MostlyPlayedModel(
      {required this.id,
      required this.title,
      required this.artist,
      required this.filePath});
}
