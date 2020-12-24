import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

Widget ytWidget(){
  Get.find<DetailsController>().initYoutubeController();
  return YoutubePlayerIFrame(
      controller: Get.find<DetailsController>().ytController,
      aspectRatio: 16 / 9,
    );
}
