// import 'package:flutter/material.dart';
// import 'package:play_tune/costom_widgets/appbar.dart';
// import 'package:play_tune/utils/color.dart';

// class SongScreen extends StatefulWidget {
//   final String songTitle;
//   final String imageForTile;
//   final String artist;

//   const SongScreen({
//     Key? key,
//     required this.songTitle,
//     required this.imageForTile,
//     required this.artist,
//   });
//   @override
//   State<SongScreen> createState() => _SongScreenState();
// }

// class _SongScreenState extends State<SongScreen> {
//   bool isFavorite = false;
//   bool isAddPlaylist = false;
//   bool isPlaying = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: '        Now playing',
//       ),
//       body: Container(
//         decoration: bgTheme(),
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               ImagePortion(),
//               controlSecotion()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ImagePortion() {
//   //   return Column(
//   //     children: [
//   //       Container(
//   //         decoration: BoxDecoration(
//   //             border: Border.all(color: Colors.white, width: 5),
//   //             borderRadius: BorderRadius.circular(20)),
//   //         height: 300,
//   //         width: 300,
//   //         child: ClipRRect(
//   //           borderRadius: BorderRadius.circular(20),
//   //           child: Image.asset(
//   //             widget.imageForTile,
//   //             fit: BoxFit.cover,
//   //           ),
//   //         ),
//   //       ),
//   //       Text(
//   //         widget.songTitle,
//   //         style: const TextStyle(
//   //           fontSize: 21,
//   //         ),
//   //       ),
//   //       Text(
//   //         widget.artist,
//   //       ),
//   //     ],
//   //   );
//   // }

//   // controlSecotion() {
//     // return Column(
//     //   children: [
//     //     Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //       children: [
//     //         IconButton(
//     //             onPressed: () {
//     //               setState(() {
//     //                 isFavorite = !isFavorite;
//     //               });
//     //             },
//     //             icon: Icon(
//     //               isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
//     //               size: 30,
//     //             ),
//     //             color: isFavorite ? Colors.red : Colors.black),
//     //         IconButton(
//     //             onPressed: () {
//     //               setState(() {
//     //                 isAddPlaylist = !isAddPlaylist;
//     //               });
//     //             },
//     //             icon: Icon(
//     //                 isAddPlaylist
//     //                     ? Icons.playlist_add_check
//     //                     : Icons.playlist_add,
//     //                 size: 30),
//     //             color: isAddPlaylist ? Colors.green : Colors.black)
//     //       ],
//     //     ),
//     //     const SizedBox(
//     //       height: 110,
//     //     ),
//     //     Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//     //       children: [
//     //         IconButton(
//     //             onPressed: () {},
//     //             icon: const Icon(
//     //               Icons.shuffle,
//     //             )),
//     //         IconButton(
//     //             onPressed: () {},
//     //             icon: const Icon(Icons.skip_previous_rounded, size: 40)),
//     //         Container(
//     //           decoration: BoxDecoration(
//     //               borderRadius: BorderRadius.circular(100),
//     //               color: Colors.white),
//     //           child: IconButton(
//     //               onPressed: () {
//     //                 setState(() {
//     //                   isPlaying = !isPlaying;
//     //                 });
//     //               },
//     //               icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
//     //                   size: 45)),
//     //         ),
//     //         IconButton(
//     //             onPressed: () {},
//     //             icon: const Icon(Icons.skip_next_rounded, size: 40)),
//     //         IconButton(
//     //             onPressed: () {}, icon: const Icon(Icons.repeat_rounded)),
//     //       ],
//     //     ),
//     //   ],
//     // );
//   }
// // }
// class SongDetailPortion extends StatelessWidget {
//   const SongDetailPortion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.white, width: 5),
//               borderRadius: BorderRadius.circular(20)),
//           height: 300,
//           width: 300,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.asset(
//               widget.imageForTile,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Text(
//           widget.songTitle,
//           style: const TextStyle(
//             fontSize: 21,
//           ),
//         ),
//         Text(
//           widget.artist,
//         ),
//       ],
//     ); ;
//   }
// }
// class SongControlportion extends StatefulWidget {
//   const SongControlportion({super.key});

//   @override
//   State<SongControlportion> createState() => _SongControlportionState();
// }

// class _SongControlportionState extends State<SongControlportion> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isFavorite = !isFavorite;
//                   });
//                 },
//                 icon: Icon(
//                   isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
//                   size: 30,
//                 ),
//                 color: isFavorite ? Colors.red : Colors.black),
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isAddPlaylist = !isAddPlaylist;
//                   });
//                 },
//                 icon: Icon(
//                     isAddPlaylist
//                         ? Icons.playlist_add_check
//                         : Icons.playlist_add,
//                     size: 30),
//                 color: isAddPlaylist ? Colors.green : Colors.black)
//           ],
//         ),
//         const SizedBox(
//           height: 110,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.shuffle,
//                 )),
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.skip_previous_rounded, size: 40)),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   color: Colors.white),
//               child: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isPlaying = !isPlaying;
//                     });
//                   },
//                   icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
//                       size: 45)),
//             ),
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.skip_next_rounded, size: 40)),
//             IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.repeat_rounded)),
//           ],
//         ),
//       ],
//     );;
//   }
// }

// 2

// import 'package:flutter/material.dart';
// import 'package:play_tune/costom_widgets/appbar.dart';
// import 'package:play_tune/utils/color.dart';

// class PlayScreen extends StatefulWidget {
//   final String songTitle;
//   final String imageForTile;
//   final String artist;

//   const PlayScreen({
//     Key? key,
//     required this.songTitle,
//     required this.imageForTile,
//     required this.artist,
//   }) : super(key: key);

//   @override
//   State<PlayScreen> createState() => _PlayScreenState();
// }

// class _PlayScreenState extends State<PlayScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: '        Now playing',
//       ),
//       body: Container(
//         decoration: bgTheme(),
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               SongDetailPortion(
//                 songTitle: widget.songTitle,
//                 imageForTile: widget.imageForTile,
//                 artist: widget.artist,
//               ),
//               const SongControlPortion(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SongDetailPortion extends StatelessWidget {
//   final String songTitle;
//   final String imageForTile;
//   final String artist;

//   const SongDetailPortion({
//     Key? key,
//     required this.songTitle,
//     required this.imageForTile,
//     required this.artist,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.white, width: 5),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           height: 300,
//           width: 300,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.asset(
//               imageForTile,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Text(
//           songTitle,
//           style: const TextStyle(
//             fontSize: 21,
//           ),
//         ),
//         Text(
//           artist,
//         ),
//       ],
//     );
//   }
// }

// class SongControlPortion extends StatefulWidget {
//   const SongControlPortion({Key? key}) : super(key: key);

//   @override
//   State<SongControlPortion> createState() => _SongControlPortionState();
// }

// class _SongControlPortionState extends State<SongControlPortion> {
//   bool isFavorite = false;
//   bool isAddPlaylist = false;
//   bool isPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isFavorite = !isFavorite;
//                 });
//               },
//               icon: Icon(
//                 isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
//                 size: 30,
//               ),
//               color: isFavorite ? Colors.red : Colors.black,
//             ),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isAddPlaylist = !isAddPlaylist;
//                 });
//               },
//               icon: Icon(
//                 isAddPlaylist ? Icons.playlist_add_check : Icons.playlist_add,
//                 size: 30,
//               ),
//               color: isAddPlaylist ? Colors.green : Colors.black,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 110,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.shuffle,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.skip_previous_rounded, size: 40),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: Colors.white,
//               ),
//               child: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isPlaying = !isPlaying;
//                   });
//                 },
//                 icon: Icon(
//                   isPlaying ? Icons.pause : Icons.play_arrow,
//                   size: 45,
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.skip_next_rounded, size: 40),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.repeat_rounded),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// 3

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class PlayScreen extends StatefulWidget {
  final String songTitle;
  final String imageForTile;
  final String artist;
  final String filePath;

  const PlayScreen({
    Key? key,
    required this.songTitle,
    required this.imageForTile,
    required this.artist,
    required this.filePath,
  }) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  double position = 0;
  double maxDuration = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      if (mounted) {
        setState(() {
          maxDuration = duration.inSeconds.toDouble();
          isLoading = false;
        });
      }
    });
    _audioPlayer.onPositionChanged.listen((Duration position) {
      if (mounted) {
        setState(() {
          this.position = position.inSeconds.toDouble();
        });
      }
    });
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    try {
      String filePath = await _getActualFilePath(widget.filePath);
      await _audioPlayer.play(DeviceFileSource(filePath));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<String> _getActualFilePath(String filePath) async {
    // Handle platform-specific file paths
    if (Platform.isAndroid) {
      // Handle Android file paths
      return filePath;
    } else if (Platform.isIOS) {
      // Handle iOS file paths
      return filePath;
    } else {
      // Handle other platforms
      return filePath;
    }
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      try {
        await _audioPlayer.play(DeviceFileSource(widget.filePath));
      } catch (e) {
        print('Error playing audio: $e');
      }
    }
  }

  void _seekTo(double position) async {
    try {
      await _audioPlayer.seek(Duration(seconds: position.toInt()));
    } catch (e) {
      print('Error seeking audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now playing'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SongDetailPortion(
                songTitle: widget.songTitle,
                imageForTile: widget.imageForTile,
                artist: widget.artist,
              ),
              SizedBox(height: 30),
              SongControlPortion(
                onPlayPause: _togglePlayPause,
                isPlaying: isPlaying,
                position: position,
                maxDuration: maxDuration,
                isLoading: isLoading,
                onSeek: _seekTo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SongDetailPortion extends StatelessWidget {
  final String songTitle;
  final String imageForTile;
  final String artist;

  const SongDetailPortion({
    Key? key,
    required this.songTitle,
    required this.imageForTile,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'your_image_path', // Replace with your image path
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        Text(
          songTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          artist,
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      ],
    );
  }
}

class SongControlPortion extends StatefulWidget {
  final VoidCallback onPlayPause;
  final bool isPlaying;
  final double position;
  final double maxDuration;
  final bool isLoading;
  final Function(double) onSeek;

  const SongControlPortion({
    Key? key,
    required this.onPlayPause,
    required this.isPlaying,
    required this.position,
    required this.maxDuration,
    required this.isLoading,
    required this.onSeek,
  }) : super(key: key);

  @override
  _SongControlPortionState createState() => _SongControlPortionState();
}

class _SongControlPortionState extends State<SongControlPortion> {
  bool isFavorite = false;
  bool isAddPlaylist = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ... (favorite and playlist buttons)
        SizedBox(height: 110),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shuffle),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_previous_rounded, size: 40),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: widget.onPlayPause,
                icon: Icon(
                  widget.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 45,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next_rounded, size: 40),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.repeat_rounded),
            ),
          ],
        ),
        Slider(
          value: widget.position,
          min: 0,
          max: widget.maxDuration,
          onChanged: (value) {
            widget.onSeek(value);
          },
          activeColor: Colors.blue,
        ),
        if (widget.isLoading) CircularProgressIndicator(),
      ],
    );
  }
}
