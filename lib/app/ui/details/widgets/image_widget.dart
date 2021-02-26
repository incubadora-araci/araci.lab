import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageCard(String uri,{BoxFit fit, double width, double height, AlignmentGeometry  alignment}) {

  return Container(
      width: width??Get.width,
      height: height??200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: uri.contains('http') ? Image.network(uri) : AssetImage(uri),
          fit: fit??BoxFit.cover,
          alignment: alignment??Alignment.center,
        ),
      ),
    );
}