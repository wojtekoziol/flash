import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kPaddingM),
      child: Container(
        height: 50,
        width: 50,
        color: Colors.amber,
      ),
    );
  }
}
