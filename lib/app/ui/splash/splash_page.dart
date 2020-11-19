// import 'package:araci/app/routes/app_pages.dart';
// import 'package:araci/app/ui/home/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:get/get.dart';
//
// class SplashPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       nextScreen: HomePage(),
//       splashTransition: SplashTransition.scaleTransition,
//       pageTransitionType: PageTransitionType.fade,
//
// //      gradientBackground: LinearGradient(
// //        begin: Alignment.topRight,
// //        end: Alignment.bottomLeft,
// //        colors: [Colors.green[300], Colors.green[600]],
// //      ),
//     );
//   }
// }

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:araci/app/bindings/splash_bindings.dart';
import 'package:araci/app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';


 class SplashPage extends GetView<SplashController> {
   /// if you need you can pass the tag for
   /// Get.find<AwesomeController>(tag:"myTag");
   SplashPage({Key key}):super(key:key);

   @override
   Widget build(BuildContext context) {
      return Scaffold(
        body:AnimatedSplashScreen.withScreenFunction(
            splash: "assets/images/regia_araci.png",
            splashIconSize: 200,
            screenFunction: controller.getLoginStatus,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.rotate,
            animationDuration: Duration(seconds: 2,milliseconds: 500),
            duration: 3000,
        ),
      );
   }
 }
//On screenFunction put a function from the controler that selects the next ṕage based on isLogged
// class SplashPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: GetX<SplashController>(
//             builder: (_) {
//               return AnimatedSplashScreen.withScreenFunction(
//                 screenFunction: _.getLoginStatus,
//                 splashTransition: SplashTransition.scaleTransition,
//                 animationDuration: Duration(seconds: 2),
//                 duration: 3000,
//               );
//             }),
//       ),
//     );
//   }
// }
