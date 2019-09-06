import 'dart:async';

import 'package:flutter/material.dart';

import 'Homepage.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Homepage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          "This is demo app",style: TextStyle(
            color: Colors.white, fontSize: 30.0, ),),
      ),
      
    );
  }
}