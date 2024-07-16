import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String search;
  final IconData iconData;
  const SearchTextField({super.key,
  required this.search,
  required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container( height: 40,
      child: Scaffold(
        body: TextField(
          decoration: InputDecoration(

            border: InputBorder.none,
            hintText: search,
            hintStyle: TextStyle(fontSize: 18),
            prefixIcon: Icon(iconData,size: 17,),
            fillColor: Colors.blueAccent.withOpacity(.1),
            filled: true
          ),
        ),
      ),
    );
  }
}
