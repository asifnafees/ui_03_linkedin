import 'package:flutter/material.dart';
import 'package:ui_03_linkedin/constants.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String subTitle;
  final String time;
  final String changes;
  final IconData iconData1;
  final IconData iconData2;
  const UserInfo({super.key,
  required this.name,
    required this.subTitle,
    required this.time,
    required this.changes,
    required this.iconData1,
    required this.iconData2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [Text(name,style:
          TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),Text('.1st',style: myTextStyle,),],),
          Text(subTitle,style: myTextStyle,),
          Row(children: [
            Text(time,style: myTextStyle,),SizedBox(width: 5,),Text(changes,style: myTextStyle,)
          ],)

        ],),
        SizedBox(width: 110,),
        Icon(iconData1),SizedBox(width: 20,),
        Icon(iconData2)
      ],),
    );
  }
}
