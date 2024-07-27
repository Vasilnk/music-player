import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:play_tune/data%20base/model/db_model.dart';
import 'package:play_tune/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Hive
    await Hive.initFlutter();
    print('Hive initialized');

    // Register Hive adapter
    if (!Hive.isAdapterRegistered(SongDBModelAdapter().typeId)) {
      Hive.registerAdapter(SongDBModelAdapter());
      print('Hive adapter registered');
    }

    // Open Hive box
    await Hive.openBox<SongDBModel>('songs');
    print('Box created');

    // Initialize Just Audio Background
    // await JustAudioBackground.init(
    //   androidNotificationChannelId: 'com.example.app.channel.audio',
    //   androidNotificationChannelName: 'Audio Playback',
    //   androidNotificationOngoing: true,
    // );

    runApp(const MyApp());
  } catch (e) {
    print('Error during initialization: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 129, 49, 49),
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Play Tune',
      home: SplashScreen(),
    );
  }
}
