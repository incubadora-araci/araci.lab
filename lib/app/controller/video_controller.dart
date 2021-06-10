import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class VideoController extends GetxController {

  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
  String link;
  YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    startController();
    super.onInit();
  }

  void startController() {
     youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId("${Get.arguments["url"]}"),
      params: YoutubePlayerParams(
        showFullscreenButton: true,
        color: 'green'
      ),
    );
     Future.delayed(Duration(milliseconds: 1500), () => update());
  }

}

