import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/costom_widgets/list_tile.dart';
import 'package:play_tune/data%20base/model/db_mostly_model.dart';

class MostlyPlayedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mostlyPlayedBox = Hive.box<MostlyPlayedModel>('mostly');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Mostly Played '),
      body: ValueListenableBuilder(
        valueListenable: mostlyPlayedBox.listenable(),
        builder: (context, Box<MostlyPlayedModel> box, _) {
          final mostlyPlayedSongs = box.values.toList();

          return ListView.builder(
            itemCount: mostlyPlayedSongs.length,
            itemBuilder: (context, index) {
              final song = mostlyPlayedSongs[index];
              return SongListTile(
                context: context,
                index: index,
                song: song,
                songs: mostlyPlayedSongs,
              );
            },
          );
        },
      ),
    );
  }
}
