import 'package:chatify/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';



class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => WelcomeScreen())));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Image.asset("images/AppBrand.jpg",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,),
      ),
    );
  }
}