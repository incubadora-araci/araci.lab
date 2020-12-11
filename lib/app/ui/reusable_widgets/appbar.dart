import 'package:flutter/material.dart';

class AppBars {
  static Widget mainAppBar() {
    return AppBar(

      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/regia_araci.png",
            fit: BoxFit.contain,
            height: 32,
          ),
          Text("  ARACI.lab", style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.w300),)
        ],
      ),
    );
  }
}