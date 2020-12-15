import 'package:araci/app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


 class SplashPage extends GetView<SplashController> {
   /// if you need you can pass the tag for
   /// Get.find<AwesomeController>(tag:"myTag");
   SplashPage({Key key}):super(key:key);

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       body: Stack(
         children: <Widget>[
           Container(
             decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.topRight,
                   end: Alignment.bottomLeft,
                   colors: [
                     Color(0xFFC335FF),
                     Color(0xFF59FF4D)
                   ],
                 )
             ),
           ),
           Center(
             child: Container(
               child: Image.asset(
                 "assets/images/AraciLabLogo.png",
                 alignment: Alignment.center,
               ),
               padding: EdgeInsets.all(100),
             ),
           ),
         ],
       ),
     );
  }
   // @override
   // Widget build(BuildContext context) {
   //    return Scaffold(
   //      body:AnimatedSplashScreen.withScreenFunction(
   //          splash: "assets/images/regia_araci.png",
   //          splashIconSize: 200,
   //          screenFunction: controller.getLoginStatus,
   //          splashTransition: SplashTransition.fadeTransition,
   //          pageTransitionType: PageTransitionType.rotate,
   //          animationDuration: Duration(seconds: 2,milliseconds: 500),
   //          duration: 3000,
   //      ),
   //    );
   // }
 }
