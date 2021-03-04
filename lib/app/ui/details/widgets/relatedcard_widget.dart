import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:flutter/material.dart';

Widget relatedCard(String imageUri) {
  return Card(
//      elevation: 3,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: imageCard(imageUri,width: 100, height: 100, fit: BoxFit.fitWidth),
      // child: Container(
      //   width: 100,
      //   height: 100,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(imageName),
      //       fit: BoxFit.fitWidth,
      //       alignment: Alignment.center,
      //     ),
      //   ),
      // )
  );
}