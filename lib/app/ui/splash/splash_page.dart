import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';


 class SplashPage extends StatelessWidget {
   /// if you need you can pass the tag for
   /// Get.find<AwesomeController>(tag:"myTag");
   SplashPage({Key? key}):super(key:key);

   @override
  Widget build(BuildContext context) {
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
           // Positioned(
           //   child: Padding(
           //     padding: const EdgeInsets.only(bottom:8.0),
           //     child: Align(
           //         alignment: Alignment.bottomLeft,
           //         child: Row(
           //            // mainAxisAlignment: MainAxisAlignment.end,
           //           children: [
           //            SvgPicture.asset("assets/images/PPGCINE_Logo_Vertical.svg",width: 40,height: 40,),
           //            SizedBox(width: 20),
           //            SvgPicture.asset("assets/images/LogoUFF.svg",width: 150,height: 80,),
           //            SizedBox(width: 20),
           //            SvgPicture.asset("assets/images/PPGCINE_Logo_Vertical.svg",width: 40,height: 40,),
           //           ],
           //         )
           //     ),
           //   ),
           // ),
           Positioned(
               child: Padding(
                 padding: const EdgeInsets.only(bottom: 92.0),
                 child: Align(
                   alignment: Alignment.bottomCenter,
                   child: SvgPicture.asset("assets/images/LogoUFF.svg",width: 150,height: 80),
                 ),
               )
           ),
           Positioned(
               child: Padding(
                 padding: const EdgeInsets.only(left: 18.0,bottom: 18.0),
                 child: Align(
                   alignment: Alignment.bottomLeft,
                   child: SvgPicture.asset("assets/images/PPGCINE_Logo_Vertical.svg",width: 40,height: 40),
                 ),
               )
           ),
           Positioned(
               child: Align(
                 alignment: Alignment.bottomCenter,
                 child: Image.asset("assets/images/logo_agir_sem_fundo.png",width: 80,height: 80)
               )
           ),
           Positioned(
               child: Padding(
                 padding: const EdgeInsets.only(right: 4.0,bottom: 24.0),
                 child: Align(
                   alignment: Alignment.bottomRight,
                   child: SvgPicture.asset("assets/images/CineVideoLogoClean.svg",width: 20,height: 20),
                 ),
               )
           ),
         ],
       ),
     );
  }
 }
