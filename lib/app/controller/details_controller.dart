import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailsController extends GetxController {

  final ArticleRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  @override
  void onInit() async {
    // initYoutubeController();
    super.onInit();
    // addArticle();
  }

  //TODO: Implement the getter for title, body and links
  Future<String> getStuff(int id, String field) {
    return repository.findArticleById(id)[field];
  }


  // initYoutubeController(){
  //   ytController = YoutubePlayerController(
  //     initialVideoId: YoutubePlayerController.convertUrlToId("https://www.youtube.com/watch?v=xqr9gV5E2Lg"),
  //     params: YoutubePlayerParams(
  //       autoPlay: true,
  //       // color: 'black',
  //       // playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
  //       // startAt: Duration(seconds: 30),
  //       showControls: true,
  //       showFullscreenButton: true,
  //     ),
  //   );
  // }
}