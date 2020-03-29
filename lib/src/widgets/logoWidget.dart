import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(width: 3, color: Colors.lightGreen)),
      height: 100,
      width: 100,
      child: Image.asset("images/logos/logoApp.png"),
    );
  }
}
