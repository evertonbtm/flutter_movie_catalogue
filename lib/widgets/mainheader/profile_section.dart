import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Batista",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          width: 20,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/img/profile.thumbnail.jpeg"),
          radius: 35,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        SizedBox(
          width: 40,
        ),
      ],
    );
  }
}
