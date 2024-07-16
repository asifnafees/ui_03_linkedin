import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_03_linkedin/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(10),
          child: AppBar(backgroundColor: Color(0xff0077B5),)),
      body: Center(child: Image( height: 200,width: 200,
          image: AssetImage('assets/images/linkedin.png'))),
    );
  }
}
