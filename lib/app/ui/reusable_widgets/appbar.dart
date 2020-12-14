import 'package:araci/app/controller/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBars {
  static Widget mainAppBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: ()=> Get.find<DetailsController>().popRoute(),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/regia_araci.png",
            fit: BoxFit.contain,
            height: 32,
          ),
          Text("ARACI.lab", style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.w300),)
        ],
      ),
    );
  }
}