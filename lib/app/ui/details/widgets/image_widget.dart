import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageCard(String uri,{BoxFit fit, double width, double height, AlignmentGeometry  alignment}) {

  return Container(
      width: width??Get.width,
      height: height??200,
      child: uri.contains('http') ? CachedNetworkImage(imageUrl: uri,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress), ) : Image.asset(uri),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: uri.contains('http') ? CachedNetworkImage(imageUrl: uri,
      //       progressIndicatorBuilder: (context, url, downloadProgress) =>
      //         CircularProgressIndicator(value: downloadProgress.progress), ) : AssetImage(uri),
      //     fit: fit??BoxFit.cover,
      //     alignment: alignment??Alignment.center,
      //   ),
      // ),
    );
}