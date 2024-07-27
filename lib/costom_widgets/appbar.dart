import 'package:flutter/material.dart';
import 'package:play_tune/utils/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final GlobalKey<ScaffoldState>? scaffoldKey;

  CustomAppBar({
    required this.title,
    this.scaffoldKey,
  });
  colors col = colors();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: scaffoldKey != null
          ? IconButton(
              onPressed: () {
                scaffoldKey!.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                size: 35,
              ))
          :
          // SizedBox(
          //     width: 50,
          //   ),
          Icon(Icons.music_note),
      backgroundColor: Color.fromARGB(255, 243, 235, 235),
      title: Text(
        title,
        style: TextStyle(
            color: Color.fromARGB(255, 78, 13, 13),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
