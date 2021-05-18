
//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withAlpha(200),
          ],
        ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90)
          ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 8.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Caderno \nde \nOração",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30
          ),

        ),
      ),
    );
  }
}
