import 'package:hive/hive.dart';

part 'db_playlist_model.g.dart';

@HiveType(typeId: 3)
class PlayListModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<String> songIds;

  PlayListModel({required this.id, required this.name, required this.songIds});
}
