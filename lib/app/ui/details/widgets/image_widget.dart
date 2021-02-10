import 'package:araci/app/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageCard(String fileName) {
  return Container(
      width: Get.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(fileName),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
}