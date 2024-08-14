import 'package:flutter/material.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/costom_widgets/list_tile.dart';
import 'package:play_tune/data%20base/function/db_function.dart';
import 'package:play_tune/data%20base/model/db_model.dart';
import 'package:play_tune/screens/all_songs/search_song.dart';

class AllSongsScreen extends StatefulWidget {
  final bool? bool1;
  AllSongsScreen(this.bool1);
  @override
  _AllSongsScreenState createState() => _AllSongsScreenState();
}

class _AllSongsScreenState extends State<AllSongsScreen> {
  List<SongDBModel> _songs = [];
  List<SongDBModel> _filteredSongs = [];
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadSongs();
    searchController.addListener(filterSongs);
  }

  Future<void> _loadSongs() async {
    final songs = await loadSongs();
    setState(() {
      _songs = songs;
      _filteredSongs = songs;
    });
  }

  void filterSongs() {
    final query = searchController.text.toLowerCase();
    setState(() {
      _filteredSongs = _songs.where((song) {
        final songTitle = song.title.toLowerCase();
        final songArtist = song.artist.toLowerCase();
        return songTitle.contains(query) || songArtist.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'All Songs',
      ),
      body: Column(
        children: [
          widget.bool1 == true
              ? SearchBarPortion(
                  controller: searchController,
                  focusNode: searchFocusNode,
                )
              : SizedBox(),
          Expanded(
            child: _filteredSongs.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredSongs.length,
                    itemBuilder: (context, index) {
                      final song = _filteredSongs[index];

                      return SongListTile(
                        song: song,
                        context: context,
                        songs: _filteredSongs,
                        index: index,
                        // isfavorite: false
                      );
                    },
                  )
                : Center(
                    child: Text("No result ' ${searchController.text} '"),
                  ),
          ),
        ],
      ),
    );
  }
}
