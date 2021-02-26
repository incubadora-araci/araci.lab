import 'package:araci/app/controller/intro_controller.dart';
import 'package:araci/app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Page')),
      body: GetBuilder<IntroController>(
        init: IntroController(),
        builder: (_){

          return IntroductionScreen(
            pages: _.listPagesViewModel,
            onDone: () {
              return _.navigateNext();// When done button is press
            },
            onSkip: () => _.navigateNext(),
              // You can also override onSkip callback

            showSkipButton: true,
            skip: const Icon(Icons.skip_next),
            next: const Icon(Icons.navigate_next),
            done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: appThemeData.accentColor,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                )
            ),
          );


        },
      )
    );
  }
}

