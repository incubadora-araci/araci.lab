import 'package:araci/app/controller/video_controller.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: markdownTitleWidget('${Get.arguments["title"]}'),centerTitle: true,),
      body: Container(
        child: GetBuilder<VideoController>(
            init: VideoController(),
            builder: (_) {
              return _.youtubePlayerController == null ? Center(child: CircularProgressIndicator()) :
              YoutubePlayerIFrame(
                controller: _.youtubePlayerController,
                aspectRatio: 16 / 9,
              );
            }),
      ),
    );
  }
}

Widget get _space => const SizedBox(height: 10);
