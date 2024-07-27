import 'package:flutter/material.dart';
import 'package:play_tune/utils/color.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.share,
      Icons.feedback_rounded,
      Icons.lock_outline,
      Icons.error_outlined
    ];
    final List<String> Labels = [
      'Share',
      'Feedback',
      'Privacy Policy',
      'About'
    ];
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        decoration: bgTheme(),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset('assets/images/images_logo.png')),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Play Tune',
                style: TextStyle(
                    color: Color.fromARGB(255, 99, 93, 93),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        icons[index],
                        color: Color.fromARGB(255, 14, 13, 13),
                        size: 30,
                      ),
                      title: Text(
                        Labels[index],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 99, 93, 93),
                            fontSize: 20),
                      ),
                      onTap: () {},
                    ),
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
