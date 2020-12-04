import 'package:araci/app/ui/size_config.dart';
import 'package:flutter/material.dart';

///TODO widget
Widget relatedArticles(String fileName) {
  return Container(
    width: SizeConfig.screenWidth,
    height: 200,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(fileName),
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
      ),
    ),
  );
}