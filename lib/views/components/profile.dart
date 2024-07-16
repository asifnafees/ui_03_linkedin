import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String image;
  final double radius;
  const Profile({super.key,
  required this.image,
  required this.radius});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(radius: radius,
        backgroundImage: AssetImage(image),),
    );
  }
}
