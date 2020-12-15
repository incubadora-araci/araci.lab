import 'package:flutter/material.dart';

Widget relatedCard(String imageName) {
  return Card(
//      elevation: 3,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageName),
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ),
      )
  );
}