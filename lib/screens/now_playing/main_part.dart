import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/data%20base/function/db_function.dart';
import 'package:play_tune/screens/now_playing/control_portion.dart';
import 'package:play_tune/screens/now_playing/song_info.dart';
import 'package:play_tune/utils/color.dart';

class NowPlayingScreen extends StatefulWidget {
  final List<dynamic> songs;
  final int initialIndex;

  NowPlayingScreen({
    required this.songs,
    required this.initialIndex,
  });

  @override
  _NowPlayingScreenState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  late AudioPlayer _audioPlayer;
  late int _currentIndex;
  bool _isPlaying = true;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _currentIndex = widget.initialIndex;
    _playSong();
  }

  Future<void> _playSong() async {
    await _audioPlayer.setUrl(widget.songs[_currentIndex].filePath);
    _audioPlayer.play();
    mostlyFunction(widget.songs[_currentIndex].filePath.toString(),
        widget.songs[_currentIndex]);
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      _isPlaying ? _audioPlayer.play() : _audioPlayer.pause();
    });
  }

  void _playNext() {
    if (_currentIndex < widget.songs.length - 1) {
      setState(() {
        _currentIndex++;
        _playSong();
      });
    }
  }

  void _playPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _playSong();
      });
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
      appBar: CustomAppBar(
        title: 'Now Playing',
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: bgTheme(),
        child: Column(
          children: [
            SongInfo(song: widget.songs[_currentIndex]),
            SizedBox(height: 10),
            ControlPortion(
                audioPlayer: _audioPlayer,
                isPlaying: _isPlaying,
                togglePlayPause: _togglePlayPause,
                playNext: _playNext,
                playPrevious: _playPrevious,
                song: widget.songs[_currentIndex]),
          ],
        ),
      ),
    );
  }
}
