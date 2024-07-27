import 'package:flutter/material.dart';
import 'package:play_tune/costom_widgets/appbar.dart';
import 'package:play_tune/screens/drower_screen.dart';

class PlayListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      // key: _scaffoldKey,
      drawer: const DrawerScreen(),
      appBar: CustomAppBar(
        title: '           Play List',
        // scaffoldKey: _scaffoldKey,
      ),
      body: ListTile(
        title: const Text(
          'Add new play list',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          onPressed: () {
            showMenu(
              color: Color.fromARGB(255, 228, 221, 221),
              context: context,
              position: const RelativeRect.fromLTRB(50, 200, 50, 0),
              items: [
                PopupMenuItem(
                  value: 'create',
                  child: Container(
                    width: 250,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Create play list',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter playlist name',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          icon: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
