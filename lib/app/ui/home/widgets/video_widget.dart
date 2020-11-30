import 'package:araci/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

Widget ytWidget(){
  return Container(
    child: YoutubePlayerIFrame(
      controller: Get.find<HomeController>().ytController,
      aspectRatio: 16 / 9,
    ),
  );
}

