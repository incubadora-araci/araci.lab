import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailsController extends GetxController {

  final ArticleRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);
  String articleTitle;
  String articleBody;
  String externalURL;
  String imgPath;
  String relatedImgPath;
  String videoURL;
  List<int> relatedIds;
  List<Map<String,dynamic>> relatedArticlesInformation;
  YoutubePlayerController ytController;

  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  @override
  void onInit() async {
    // initYoutubeController();
    await getArticle(1);
    initYoutubeController();
    super.onInit();
    // addArticle();
  }

  getRelatedArticles(List<int> ids) async {
    for (int id in ids){
      Map<String,dynamic> article = await repository.findArticleById(id);
      relatedArticlesInformation.add({"title":article["title"],"imgPath":article["imgPath"]??""});
    }

  }
  getArticle(int id) async {
    Map<String,dynamic> article = await repository.findArticleById(id);
    articleTitle = article["title"]??"";
    articleBody = article["body"]??"";
    externalURL = article["externalURL"]; //TODO: probably a bug.
    imgPath = article["imgPath"];
    videoURL = article["videoURL"]; //TODO: probably a bug.
    relatedIds = article["related"];
    await getRelatedArticles(relatedIds);
    update();
  }

  initYoutubeController(){
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId(videoURL??""), //TODO: If the video doesn't appear this is the problem
      params: YoutubePlayerParams(
        autoPlay: true,
        // color: 'black',
        // playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
        // startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
      ),
    );
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