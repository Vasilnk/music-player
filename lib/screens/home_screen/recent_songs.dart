import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_tune/costom_widgets/list_tile.dart';
import 'package:play_tune/data%20base/model/db_recent_model.dart';

class RecentSongs extends StatelessWidget {
  const RecentSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<RecentDBModel>('recent').listenable(),
      builder: (context, Box<RecentDBModel> box, w) {
        final recentSongs = box.values.toList();

        return recentSongs.isNotEmpty
            ? Expanded(
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '  Recently Played',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recentSongs.length,
                    itemBuilder: (context, index) {
                      final song = recentSongs[index];

                      return SongListTile(
                        context: context,
                        index: index,
                        song: song,
                        songs: recentSongs,
                        // isfavorite: false,
                      );
                    },
                  )
                ]),
              )
            : SizedBox();
      },
    );
  }
}
