import 'package:flutter/material.dart';
import 'package:play_tune/Settings/privacy_policy.dart';
import 'package:play_tune/settings/about.dart';
import 'package:play_tune/settings/terms.dart';
import 'package:play_tune/utils/color.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  final List<IconData> icons = [
    Icons.share,
    Icons.feedback_rounded,
    Icons.lock_outline,
    Icons.error_outlined,
    Icons.description_outlined
  ];
  final List<String> labels = [
    'Share',
    'Feedback',
    'Privacy Policy',
    'About',
    'Terms & Conditions'
  ];
  final List screens = [
    null,
    null,
    PrivacyPolicyScreen(),
    AboutPage(),
    TermsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: bgTheme(),
        child: Column(
          children: [
            const SizedBox(height: 60),
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/images_logo.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Text(
                'Play Tune',
                style: TextStyle(
                  color: Color.fromARGB(255, 99, 93, 93),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: List.generate(icons.length, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: ListTile(
                    leading: Icon(
                      icons[index],
                      color: Color.fromARGB(255, 14, 13, 13),
                      size: 24,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        labels[index],
                        style: const TextStyle(
                          color: Color.fromARGB(255, 99, 93, 93),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    onTap: () {
                      if (index == 0) {
                        shareApp();
                      } else if (index == 1) {
                        sendFeedback();
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[index]!,
                          ),
                        );
                      }
                    },
                  ),
                );
              }),
            ),
            const Spacer(),
            const Text(
              'V.1.0.0',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendFeedback() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'vasilnk6@gmail.com',
      query: 'subject=Feedback for Your Music Player App',
    );

    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch $emailUri');
    }
  }

  void shareApp() {
    Share.share('Check out this app: https://www.amazon.com/sample_link');
  }
}
