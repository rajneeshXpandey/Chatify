import 'package:flutter/material.dart';
import 'package:chatify/components.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  bool showSpinner = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  AnimationController controller;
  Animation animation;

  String email;
  String password;

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
     body: ModalProgressHUD(
       inAsyncCall: showSpinner,
       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment(0.7, 0.2), // 10% of the width, so there are ten blinds.
             colors: [ Color(0xFF40C4FF),animation.value], // whitish to gray
             tileMode: TileMode.repeated, // repeats the gradient over the canvas
           ),
         ),
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 24.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               Hero(
                 tag:'logo',
                 child: Container(
                   height: 150.0,
                   child: Image.asset('images/AppIcon.png'),
                 ),
               ),
               SizedBox(
                 height: 10.0,
               ),
               TextField(
                 keyboardType: TextInputType.emailAddress ,
                 textAlign: TextAlign.center,
                 onChanged: (value) {
                   email = value;
                 },
                 decoration: InputDecoration(
                   hintText: 'Enter your email',
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide:
                     BorderSide(color:Color(0xff00E9B9), width: 1.0),
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide:
                     BorderSide(color:Color(0xff00E9B9), width: 2.0),
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   ),
                 ),
               ),
               SizedBox(
                 height: 5.0,
               ),
               TextField(
                 textAlign: TextAlign.center,
                 obscureText: true,
                 onChanged: (value) {
                   password = value;
                 },
                 decoration: InputDecoration(

                   hintText: 'Enter your password.',
                   contentPadding:
                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide:
                     BorderSide(color:Color(0xff00E9B9), width: 1.0),
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide:
                     BorderSide(color:Color(0xff00E9B9), width: 2.0),
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   ),
                 ),
               ),
               SizedBox(
                 height: 20.0,
               ),
               Buttons(
                 color:Color(0xff00E9B9),
                 title: 'Log In',
                 onPressed: () async {
                   setState(() {
                     showSpinner = true;
                   });

                   try {
                     final currentUser = await auth.signInWithEmailAndPassword(
                         email: email, password: password);
                     if( currentUser != null)
                     {
                       Navigator.pushNamed(context, ChatScreen.id);
                     }
                     setState(() {

                       showSpinner=false;
                     });
                   } catch (e) {
                     Alert(
                       context: context,
                       type: AlertType.error,
                       title: "User Not Exist",
                       desc: "Please Register!",
                       buttons: [
                         DialogButton(

                     child: Text(
                             "COOL",
                             style: TextStyle(color: Colors.white, fontSize: 20),
                           ),
                           onPressed: () => Navigator.pop(context),
                           width: 120,
                         )
                       ],
                     ).show();
                     print(e);
                   };
                 },
               ),
             ],
           ),
         ),
       ),
     ),

    );
  }
}
