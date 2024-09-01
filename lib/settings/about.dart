import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_tune/costom_widgets/appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'About Us',
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Introducing Our Music Player App',
                style: GoogleFonts.oswald(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 119, 50, 50),
                )),
            const SizedBox(height: 15),
            Text(
              'Our innovative music player app is designed to revolutionize your listening experience. Combining cutting-edge technology with an intuitive interface, our app offers seamless navigation through your music library.',
              style: GoogleFonts.roboto(
                fontSize: 18,
                height: 1.5,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Enjoy personalized playlists, superior sound quality, and effortless organization of your favorite tracks. Whether you\'re a music enthusiast or a casual listener, our app caters to your every need.',
              style: GoogleFonts.roboto(
                fontSize: 18,
                height: 1.5,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Elevate your music journey with our feature-rich, user-centric music player app.',
              style: GoogleFonts.roboto(
                fontSize: 18,
                height: 1.5,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
