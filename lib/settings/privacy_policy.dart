import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_tune/costom_widgets/appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Privacy Policy',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            buildSectionTitle('Introduction'),
            buildSectionContent(
              'All defined terms used below shall have the meanings set forth in Our Terms and Conditions. '
              'This Privacy Policy ("Policy") explains how information about you is collected, used, and disclosed by your access or use of this Site or otherwise as a result of your interactions with us. By visiting this Site directly or through another site, you accept the terms and conditions of this Policy.',
            ),
            buildSectionTitle('Information Collection'),
            buildSectionContent(
              'We collect information from you in several different ways on this Site.',
            ),
            buildSubSectionTitle('Registration and Ordering'),
            buildSectionContent(
              'Before using certain portions of this Site or ordering products, you may be required to complete an online registration form. During registration, you will be asked to provide certain personal information, including your name, shipping and billing address(es), phone number, email address, and credit card number.',
            ),
            buildSubSectionTitle('Information We Collect Automatically'),
            buildSectionContent(
              'We may automatically collect information about you when you access or use the Site or transact business with Us. This includes transaction information, log information, device information, and location information.',
            ),
            buildSectionTitle('Information Use and Disclosure'),
            buildSectionContent(
              'We use your personal information to process your order and provide you with customer service. We may internally use your personal information to improve this Site’s content and layout, improve outreach, and for Our own marketing efforts.',
            ),
            buildSubSectionTitle('Communications with You'),
            buildSectionContent(
              'We will use your personal information to communicate with you about this Site and your orders and deliveries.',
            ),
            buildSubSectionTitle('External Use'),
            buildSectionContent(
              'Except as otherwise set forth below, We do not sell, rent, trade, license, or otherwise disclose your specific personal information or financial information to anyone.',
            ),
            buildSectionTitle('Data Security'),
            buildSectionContent(
              'We take reasonable measures, including administrative, technical, and physical safeguards, to protect information about you from loss, theft, misuse, unauthorized access, disclosure, alteration, and destruction.',
            ),
            buildSectionTitle('Opt Out/Corrections'),
            buildSectionContent(
              'Upon your request, we will correct or update your personal information, stop sending emails to your email address, and/or disable your account to prevent any future purchases through that account.',
            ),
            buildSectionTitle('Offline Collection, Use, and Disclosure'),
            buildSectionContent(
              'We also may collect information offline. We will treat any information collected offline in a manner that is consistent with this Policy.',
            ),
          ],
        ),
      ),
    );
  }

  buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Oswald',
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Color.fromARGB(255, 119, 50, 50),
        ),
      ),
    );
  }

  buildSubSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'SUSE',
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Color.fromARGB(255, 56, 45, 119),
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
}
