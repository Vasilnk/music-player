// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:play_tune/costom_widgets/appbar.dart';
// import 'package:play_tune/costom_widgets/list_tile.dart'; // Ensure this import is correct
// import 'package:play_tune/data%20base/function/db_function.dart';
// import 'package:play_tune/data%20base/model/db_model.dart';
// import 'package:play_tune/screens/drower_screen.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class AllSongsScreen extends StatefulWidget {
//   @override
//   State<AllSongsScreen> createState() => _AllSongsScreenState();
// }

// class _AllSongsScreenState extends State<AllSongsScreen> {
//   TextEditingController searchController = TextEditingController();
//   FocusNode searchFocusNode = FocusNode();
//   final OnAudioQuery audioQuery = OnAudioQuery();
//   List<SongDBModel> songs = [];
//   List<SongDBModel> filteredSongs = [];

//   @override
//   void initState() {
//     super.initState();
//     loadSongsFromPhone();
//     searchController.addListener(filterSongs);
//   }

//   Future<void> loadSongsFromPhone() async {
//     final audioSongs = await audioQuery.querySongs();
//     List<SongDBModel> songList = await Future.wait(audioSongs.map((song) async {
//       final albumArt =
//           await audioQuery.queryArtwork(song.id, ArtworkType.AUDIO);
//       return SongDBModel(
//         id: song.id,
//         title: song.title,
//         artist: song.artist ?? 'Unknown Artist',
//         albumArt: albumArt ?? Uint8List(0),
//         filePath: song.uri ?? '',
//       );
//     }).toList());

//     await addSongsToDataBase(songList); // Store songs in Hive

//     setState(() {
//       songs = songList; // Load data into state
//       filteredSongs = songList; // Initialize filtered songs
//     });
//   }

//   void filterSongs() {
//     final query = searchController.text.toLowerCase();
//     setState(() {
//       filteredSongs = songs.where((song) {
//         final titleLower = song.title.toLowerCase();
//         return titleLower.contains(query);
//       }).toList();
//     });
//   }

//   @override
//   void dispose() {
//     searchController.removeListener(filterSongs);
//     searchController.dispose();
//     searchFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: const DrawerScreen(),
//       appBar: CustomAppBar(
//         title: 'All Songs',
//         scaffoldKey: _scaffoldKey,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             SearchBar(
//               controller: searchController,
//               focusNode: searchFocusNode,
//             ),
//             Expanded(
//               child: filteredSongs.isEmpty
//                   ? Center(child: Text('No songs found.'))
//                   : ListView.builder(
//                       itemCount: filteredSongs.length,
//                       itemBuilder: (context, index) {
//                         final song = filteredSongs[index];
//                         return SongListTile(
//                           songTitle: song.title,
//                           imageForTile: song.albumArt.isNotEmpty
//                               ? song.albumArt.toString()
//                               : 'assets/images/musicnoteImage.jpg',
//                           artist: song.artist,
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchBar extends StatelessWidget {
//   final TextEditingController controller;
//   final FocusNode focusNode;

//   const SearchBar({
//     Key? key,
//     required this.controller,
//     required this.focusNode,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       focusNode: focusNode,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(7),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         hintText: 'Search songs',
//       ),
//     );
//   }
// }

// 2

// import 'package:flutter/material.dart';
// import 'package:play_tune/costom_widgets/appbar.dart';
// import 'package:play_tune/costom_widgets/list_tile.dart';
// import 'package:play_tune/data%20base/function/db_function.dart';
// import 'package:play_tune/data%20base/model/db_model.dart';
// import 'package:play_tune/screens/drower_screen.dart';

// class AllSongsScreen extends StatefulWidget {
//   @override
//   State<AllSongsScreen> createState() => _AllSongsScreenState();
// }

// class _AllSongsScreenState extends State<AllSongsScreen> {
//   TextEditingController searchController = TextEditingController();
//   FocusNode searchFocusNode = FocusNode();
//   List<SongDBModel> songs = [];
//   List<SongDBModel> filteredSongs = [];

//   @override
//   void initState() {
//     super.initState();
//     loadSongsFromDatabase();
//     searchController.addListener(filterSongs);
//   }

//   Future<void> loadSongsFromDatabase() async {
//     final songList = getAllSongs(); // Fetch songs from database
//     // setState(() {
//     songs = songList;
//     filteredSongs = songList;
//     // });
//   }

//   void filterSongs() {
//     final query = searchController.text.toLowerCase();
//     setState(() {
//       filteredSongs = songs.where((song) {
//         final titleLower = song.title.toLowerCase();
//         return titleLower.contains(query);
//       }).toList();
//     });
//   }

//   @override
//   void dispose() {
//     searchController.removeListener(filterSongs);
//     searchController.dispose();
//     searchFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: const DrawerScreen(),
//       appBar: CustomAppBar(
//         title: 'All Songs',
//         scaffoldKey: _scaffoldKey,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             SearchBar(
//               controller: searchController,
//               focusNode: searchFocusNode,
//             ),
//             Expanded(
//               child: filteredSongs.isEmpty
//                   ? Center(child: Text('No songs found.'))
//                   : ListView.builder(
//                       itemCount: filteredSongs.length,
//                       itemBuilder: (context, index) {
//                         final song = filteredSongs[index];
//                         return SongListTile(
//                           songTitle: song.title,
//                           imageForTile: song.albumArt.isNotEmpty
//                               ? song.albumArt.toString()
//                               : 'assets/images/musicnoteImage.jpg',
//                           artist: song.artist,
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchBar extends StatelessWidget {
//   final TextEditingController controller;
//   final FocusNode focusNode;

//   const SearchBar({
//     Key? key,
//     required this.controller,
//     required this.focusNode,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       focusNode: focusNode,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(7),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         hintText: 'Search songs',
//       ),
//     );
//   }
// }

// 3
// import 'package:flutter/material.dart';
// import 'package:play_tune/costom_widgets/appbar.dart';
// import 'package:play_tune/costom_widgets/list_tile.dart';
// import 'package:play_tune/data%20base/function/db_function.dart';
// import 'package:play_tune/data%20base/model/db_model.dart';
// import 'package:play_tune/screens/drower_screen.dart';

// class AllSongsScreen extends StatefulWidget {
//   @override
//   State<AllSongsScreen> createState() => _AllSongsScreenState();
// }

// class _AllSongsScreenState extends State<AllSongsScreen> {
//   TextEditingController searchController = TextEditingController();
//   FocusNode searchFocusNode = FocusNode();
//   List<SongDBModel> songs = [];
//   List<SongDBModel> filteredSongs = [];

//   @override
//   void initState() {
//     super.initState();
//     loadSongsFromDatabase();
//     searchController.addListener(filterSongs);
//   }

//   Future<void> loadSongsFromDatabase() async {
//     final songList =
//         await getAllSongs(); // Fetch songs from database asynchronously
//     setState(() {
//       songs = songList;
//       filteredSongs = songList;
//     });
//   }

//   void filterSongs() {
//     final query = searchController.text.toLowerCase();
//     setState(() {
//       filteredSongs = songs.where((song) {
//         final titleLower = song.title.toLowerCase();
//         return titleLower.contains(query);
//       }).toList();
//     });
//   }

//   @override
//   void dispose() {
//     searchController.removeListener(filterSongs);
//     searchController.dispose();
//     searchFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//       // key: _scaffoldKey,
//       drawer: const DrawerScreen(),
//       appBar: CustomAppBar(
//         title: '         All Songs',
//         // scaffoldKey: _scaffoldKey,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             SearchBar(
//               controller: searchController,
//               focusNode: searchFocusNode,
//             ),
//             Expanded(
//               child: filteredSongs.isEmpty
//                   ? Center(child: Text('No songs found.'))
//                   : ListView.builder(
//                       itemCount: filteredSongs.length,
//                       itemBuilder: (context, index) {
//                         final song = filteredSongs[index];
//                         final truncatedTitle = song.title.length > 16
//                             ? '${song.title.substring(0, 16)}...'
//                             : song.title;
//                         return SongListTile(
//                           songTitle: truncatedTitle,
//                           imageForTile: song.albumArt.isNotEmpty
//                               ? song.albumArt.toString()
//                               : 'assets/images/musicnoteImage.jpg',
//                           artist: song.artist,
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchBar extends StatelessWidget {
//   final TextEditingController controller;
//   final FocusNode focusNode;

//   const SearchBar({
//     Key? key,
//     required this.controller,
//     required this.focusNode,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       focusNode: focusNode,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(7),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         hintText: 'Search songs',
//       ),
//     );
//   }
// }

// 4

import 'package:flutter/material.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/costom_widgets/list_tile.dart';
import 'package:play_tune/data%20base/function/db_function.dart';
import 'package:play_tune/data%20base/model/db_model.dart';
import 'package:play_tune/screens/drower_screen.dart';

class AllSongsScreen extends StatefulWidget {
  @override
  State<AllSongsScreen> createState() => _AllSongsScreenState();
}

class _AllSongsScreenState extends State<AllSongsScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  List<SongDBModel> songs = [];
  List<SongDBModel> filteredSongs = [];

  @override
  void initState() {
    super.initState();
    loadSongsFromDatabase();
    searchController.addListener(filterSongs);
  }

  Future<void> loadSongsFromDatabase() async {
    final songList =
        await getAllSongs(); // Fetch songs from database asynchronously
    setState(() {
      songs = songList;
      filteredSongs = songList;
    });
  }

  void filterSongs() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredSongs = songs.where((song) {
        final titleLower = song.title.toLowerCase();
        return titleLower.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(filterSongs);
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: CustomAppBar(
        title: '         All Songs',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SearchBar(
              controller: searchController,
              focusNode: searchFocusNode,
            ),
            Expanded(
              child: filteredSongs.isEmpty
                  ? Center(child: Text('No songs found.'))
                  : ListView.builder(
                      itemCount: filteredSongs.length,
                      itemBuilder: (context, index) {
                        final song = filteredSongs[index];
                        final truncatedTitle = song.title.length > 16
                            ? '${song.title.substring(0, 16)}...'
                            : song.title;
                        return SongListTile(
                          songTitle: truncatedTitle,
                          imageForTile: song.albumArt.isNotEmpty
                              ? song.albumArt.toString()
                              : 'assets/images/musicnoteImage.jpg',
                          artist: song.artist,
                          filePath: song.filePath, // Added filePath
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchBar({
    Key? key,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Search songs',
      ),
    );
  }
}
