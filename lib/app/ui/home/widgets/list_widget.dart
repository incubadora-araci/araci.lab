import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildList({String key, String string, BuildContext context}) {
  return Expanded(
    child: ListView(
      children: [
        homeCardWidget("Cosme Corrêa", "assets/testImages/CosmeCoffee.png", ()=> Get.toNamed(Routes.WEBVIEW, arguments: "https://pt.wikipedia.org/wiki/Volta_Redonda"  ), context),
//        homeCardWidget("Volta Redonda", "assets/testImages/VR.jpg", ()=> Get.to(webview("Volta Redonda", "https://pt.wikipedia.org/wiki/Volta_Redonda")), context),
//        homeCardWidget("Card 3", ()=> Get.snackbar("Card 3", "Card 3 selecionado", snackPosition: SnackPosition.BOTTOM), context),
//        homeCardWidget("Card 4", ()=> Get.snackbar("Card 4", "Card 4 selecionado", snackPosition: SnackPosition.BOTTOM), context),
//        homeCardWidget("Card 5", ()=> Get.snackbar("Card 5", "Card 5 selecionado", snackPosition: SnackPosition.BOTTOM), context),
//        homeCardWidget("Card 6", ()=> Get.snackbar("Card 6", "Card 6 selecionado", snackPosition: SnackPosition.BOTTOM), context)
      ],
    ),
  );
}