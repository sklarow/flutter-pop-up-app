import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/automation_ids.dart';

class FooterDisclaimer extends StatelessWidget {
  const FooterDisclaimer({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Developed by Allan Sklarow',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                key: const Key(AutomationIds.linkedinLink),
                onTap: () => _launchUrl('https://www.linkedin.com/in/sklarow/'),
                child: Text(
                  'LinkedIn Profile',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                ' • ',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              GestureDetector(
                key: const Key(AutomationIds.githubLink),
                onTap: () => _launchUrl('https://github.com/sklarow/flutter-pop-up-app/'),
                child: Text(
                  'GitHub Repository',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
