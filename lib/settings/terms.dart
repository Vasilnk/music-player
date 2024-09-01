import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_tune/costom_widgets/appbar.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});
  final String mail = 'vasilnk6@gmail.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Terms & Condition',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            buildSectionTitle('1. Acceptance of Terms'),
            buildSectionContent(
                'By using the Play Tune app, you agree to these terms. If you do not agree, please do not use the app.'),
            buildSectionTitle('2. Personal Use Only'),
            buildSectionContent(
                'The Play Tune app is provided for your personal use. You may not use it for commercial purposes.'),
            buildSectionTitle('3. User Content'),
            buildSectionContent(
                'You are responsible for any content you create or share within the app, including playlists and song selections.'),
            buildSectionTitle('4. Intellectual Property'),
            buildSectionContent(
                'All content and technology in the Play Tune app belong to us or our licensors. You may not copy or distribute any part of the app without permission.'),
            buildSectionTitle('5. Third-Party Services'),
            buildSectionContent(
                'The app may link to third-party services. We are not responsible for those services or their content.'),
            buildSectionTitle('6. No Warranties'),
            buildSectionContent(
                'The Play Tune app is provided "as is" without any guarantees. We do not guarantee the app will be error-free or uninterrupted.'),
            buildSectionTitle('7. Limitation of Liability'),
            buildSectionContent(
                'We are not liable for any damages or losses related to your use of the app.'),
            buildSectionTitle('8. Changes to the Terms'),
            buildSectionContent(
                'We may update these terms from time to time. Continued use of the app means you accept the updated terms.'),
            buildSectionTitle('9. Contact Us'),
            buildSectionContent(
                'If you have questions about these terms, please contact us at .'),
            Text(
              mail,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(136, 10, 23, 136)),
            )
          ],
        ),
      ),
    );
  }
}

buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10),
    child: Text(
      title,
      style: GoogleFonts.oswald(
        fontWeight: FontWeight.bold,
        fontSize: 19,
        color: Color.fromARGB(255, 119, 50, 50),
      ),
    ),
  );
}

buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      content,
      style: GoogleFonts.roboto(
          fontSize: 16,
          height: 1.5,
          fontStyle: FontStyle.italic,
          color: Colors.black54),
    ),
  );
}
