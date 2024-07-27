// import 'package:flutter/material.dart';
// import 'package:play_tune/costom_widgets/popUp.dart';
// import 'package:play_tune/screens/play_screen.dart';

// class SongListTile extends StatelessWidget {
//   final String songTitle;
//   final String imageForTile;
//   final String artist;

//   SongListTile({
//     required this.songTitle,
//     required this.imageForTile,
//     required this.artist,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//           color: Color.fromARGB(255, 245, 243, 243),
//           borderRadius: BorderRadius.circular(10)),

//       margin: EdgeInsets.symmetric(vertical: 5), // Add space between tiles
//       child: InkWell(
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PlayScreen(
//               songTitle: songTitle,
//               imageForTile: imageForTile,
//               artist: artist,
//             ),
//           ),
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: ConstrainedBox(
//                 constraints:
//                     BoxConstraints(maxHeight: 50, maxWidth: 50), // Reduced size
//                 child: Image.asset(
//                   imageForTile,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(width: 10), // Reduced width between image and text
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     songTitle,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 3),
//                   Text(
//                     artist,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: 10), // Reduced width between text and popup button
//             PopUpScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 2

import 'package:flutter/material.dart';
import 'package:play_tune/screens/play_screen.dart';

class SongListTile extends StatelessWidget {
  final String songTitle;
  final String imageForTile;
  final String artist;
  final String filePath;

  SongListTile({
    required this.songTitle,
    required this.imageForTile,
    required this.artist,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    print('file path is $filePath');
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 243, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayScreen(
              songTitle: songTitle,
              imageForTile: imageForTile,
              artist: artist,
              filePath: filePath,
            ),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                child: Image.asset(
                  imageForTile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filePath,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    artist,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
