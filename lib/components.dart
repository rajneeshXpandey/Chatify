import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {
  Buttons({this.color,this.title,@required this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: Material(
        elevation: 10.0,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title),
        ),
      ),
    );
  }
}
