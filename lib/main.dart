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
    // Register Hive adapter
    if (!Hive.isAdapterRegistered(SongDBModelAdapter().typeId)) {
      Hive.registerAdapter(SongDBModelAdapter());
    }
    if (!Hive.isAdapterRegistered(FavouriteDBModelAdapter().typeId)) {
      Hive.registerAdapter(FavouriteDBModelAdapter());
    }
    if (!Hive.isAdapterRegistered(RecentDBModelAdapter().typeId)) {
      Hive.registerAdapter(RecentDBModelAdapter());
    }
    if (!Hive.isAdapterRegistered(PlayListModelAdapter().typeId)) {
      Hive.registerAdapter(PlayListModelAdapter());
    }
    if (!Hive.isAdapterRegistered(MostlyPlayedModelAdapter().typeId)) {
      Hive.registerAdapter(MostlyPlayedModelAdapter());
    }

    // Open Hive box
    await Hive.openBox<SongDBModel>('songs');
    await Hive.openBox<FavouriteDBModel>('favorites');
    await Hive.openBox<RecentDBModel>('recent');
    await Hive.openBox<PlayListModel>('playlists');
    await Hive.openBox<MostlyPlayedModel>('mostly');
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
