import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: "assets/images/logo_araci.png",
      type: AnimatedSplashType.StaticDuration,
      home: HomePage(),
      duration: 4000,
//      gradientBackground: LinearGradient(
//        begin: Alignment.topRight,
//        end: Alignment.bottomLeft,
//        colors: [Colors.green[300], Colors.green[600]],
//      ),
    );
  }
}