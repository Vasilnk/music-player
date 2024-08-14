import 'package:flutter/material.dart';
import 'package:play_tune/costom_widgets/appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'About Us'),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(
            '''Introducing our innovative music player app, designed to revolutionize your listening experience. Our app combines cutting-edge technology with an intuitive interface,  offering seamless navigation through your music library. Enjoy personalized playlists, superiorsound quality, and effortless organization of your favorite tracks. Whether you're a music enthusiast or a casual listener, our app caters to your every need. Elevate your music journey with our feature-rich, user-centric music player app.''',
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
