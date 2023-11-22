import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String profileImagePath;
  final String username;
  final String businessName;

  const Profile({
    super.key,
    required this.profileImagePath,
    required this.username,
    this.businessName = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(profileImagePath),
            ),
            SizedBox(height: 16),
            Text(
              username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            if (businessName.isNotEmpty)
              Text(
                'Business: $businessName',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
