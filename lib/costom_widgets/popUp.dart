import 'package:flutter/material.dart';

class PopUpScreen extends StatelessWidget {
  const PopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Color.fromARGB(255, 202, 174, 174),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              onTap: () {},
              child: const Row(
                children: [Icon(Icons.favorite), Text('  Add to favorite')],
              )),
          const PopupMenuItem(
              child: Row(
            children: [Icon(Icons.playlist_add), Text('   Add to playlist')],
          ))
        ];
      },
    );
  }
}
