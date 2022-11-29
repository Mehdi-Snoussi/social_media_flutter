import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final int value;

  const ProfileItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const SizedBox(
          height: 10,
        ),
        Text(value.toString())
      ],
    );
  }
}
