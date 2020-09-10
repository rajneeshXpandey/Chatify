import 'package:chatify/screens/login_screen.dart';
import 'package:chatify/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatify/components.dart';
import 'dart:ui';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
    duration: Duration(seconds: 2)
    ,vsync: this);

    animation = ColorTween(begin: Color(0xFF40C4FF),end:Color(0xff050B68)).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {
      });
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.7, 0.2), // 10% of the width, so there are ten blinds.
                  colors: [ Color(0xFF40C4FF),animation.value], // whitish to gray
                  tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              //backgroundColor: Color(0xff050B68),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag:'logo',
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Image.asset('images/AppIcon.png',),
                                height: 100.0,
                              ),
                            ),
                            TypewriterAnimatedTextKit(
                            textAlign: TextAlign.start,
                           text:  ['Welcome to Chatify'],
                              textStyle: TextStyle(
                                fontFamily: 'KaushanScript-Regular',
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    Buttons(
                      color:Colors.blueAccent,
                      title: 'Log In',
                      onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, LoginScreen.id);
            },
                    ),
                    Buttons(
                        color:Color(0xff00E9B9),
                      title: 'Register',
                      onPressed: () {
                        //Go to login screen.
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
