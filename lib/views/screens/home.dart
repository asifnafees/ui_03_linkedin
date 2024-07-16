import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_03_linkedin/views/components/profile.dart';
import 'package:ui_03_linkedin/views/components/user_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(color: Colors.white,
            child: Row(children: [
              SizedBox(height: 40,width: 40,child: Profile(image: "assets/images/1.jpg",
                  radius: 25),),
              UserInfo(name: "Angle 01",
                  subTitle: "Flutter Developer UX",
                  time: "7h",
                  changes: "Edited",
                  iconData1: Icons.more_vert,
                  iconData2: FontAwesomeIcons.xmark)
            ],),
          ),
        ),
        Text('asif')

      ]),
    );
  }
}
