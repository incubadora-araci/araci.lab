import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:stack/stack.dart';

class DetailsController extends GetxController {

  final ArticleRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);
  dynamic articleId;
  dynamic articleTitle;
  dynamic articleBody;
  dynamic externalURL;
  dynamic imgPath;
  dynamic relatedImgPath;
  dynamic videoURL;
  List<int> relatedIds = [];
  List<Map<String,dynamic>> relatedArticlesInformation = [];
  var ytController;
  Stack<int> routingStack = Stack();

  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  @override
  void onInit() async {
    if (routingStack.isEmpty) routingStack.push(1);
    await getArticle(Get.arguments??1);
    print("Executando onInit details -----------------------");
    initYoutubeController();
    super.onInit();
    // addArticle();
  }

  getRelatedArticles(List<int> ids) async {
    for (int id in ids){
      Map<String,dynamic> article = await repository.findArticleById(id);
      relatedArticlesInformation.add({"id": id,"title":article["title"],"imgPath":article["imgPath"]??"assets/images/regia_araci.png"});
    }

  }
  getArticle(int id) async {
    Map<String,dynamic> article = await repository.findArticleById(id);
    print("videoURL get article:::::::: ${article["videoURL"]}");
    articleId = article["id"]??"";
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
      initialVideoId: YoutubePlayerController.convertUrlToId(videoURL??null), //TODO: If the video doesn't appear this is the problem
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