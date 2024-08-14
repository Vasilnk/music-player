import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:play_tune/data%20base/model/db_fav_model.dart';
import 'package:play_tune/data%20base/model/db_model.dart';
import 'package:play_tune/data%20base/model/db_mostly_model.dart';
import 'package:play_tune/data%20base/model/db_playlist_model.dart';
import 'package:play_tune/data%20base/model/db_recent_model.dart';
import 'package:play_tune/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Hive
    await Hive.initFlutter();
    print('Hive initialized');

    // Register Hive adapter
    if (!Hive.isAdapterRegistered(SongDBModelAdapter().typeId)) {
      Hive.registerAdapter(SongDBModelAdapter());
      print('Hive all song adapter registered');
    }
    if (!Hive.isAdapterRegistered(FavouriteDBModelAdapter().typeId)) {
      Hive.registerAdapter(FavouriteDBModelAdapter());
      print(' favorite adapter registered');
    }
    if (!Hive.isAdapterRegistered(RecentDBModelAdapter().typeId)) {
      Hive.registerAdapter(RecentDBModelAdapter());
      print(' recent  adapter registered');
    }
    if (!Hive.isAdapterRegistered(PlayListModelAdapter().typeId)) {
      Hive.registerAdapter(PlayListModelAdapter());
      print('playlist Adapter registered');
    }
    if (!Hive.isAdapterRegistered(MostlyPlayedModelAdapter().typeId)) {
      Hive.registerAdapter(MostlyPlayedModelAdapter());
      print('mostly Adapter registered');
    }

    // Open Hive box
    await Hive.openBox<SongDBModel>('songs');
    print(' Box created');
    await Hive.openBox<FavouriteDBModel>('favorites');
    print('fav Box created');
    await Hive.openBox<RecentDBModel>('recent');
    print('recent Box created');
    await Hive.openBox<PlayListModel>('playlists');
    print('playlist Box created');
    await Hive.openBox<MostlyPlayedModel>('mostly');
    print('mostly Box created');
    runApp(const MyApp());
  } catch (e) {
    print('Error during initialization: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Play Tune',
      home: SplashScreen(),
    );
  }
}
