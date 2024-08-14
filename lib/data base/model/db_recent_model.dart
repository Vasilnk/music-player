import 'package:hive/hive.dart';
part 'db_recent_model.g.dart';

@HiveType(typeId: 2)
class RecentDBModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String artist;

  @HiveField(3)
  final String filePath;

  RecentDBModel(
      {required this.id,
      required this.title,
      required this.artist,
      required this.filePath});
}
