import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:get/get.dart';
import 'package:araci/app/data/model/article_table.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeController extends GetxController {

  final ArticleRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);

  List<String> vidsList = [];
  List<Article> articleList = [];
  YoutubePlayerController ytController;
  String title;
  String content;
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  @override
  void onInit() async {
    // await updateVidsList();
    initYoutubeController();
    print("article: " + articleList[0].title);
  }

  // Future updateVidsList() async {
  //   vidsList = await repository.updateVidsList();
  //   update();
  // }
//
//  Future getArticles(DatabaseApi _databaseApi) async {
//    articleList = await repository.getArticles(_databaseApi);
//    update();
//  }
//
//  Future getTitle() async {
//    title = await repository.getTitle();
//  }
//
//  Future getContent() async {
//    content = await repository.getContent();
//  }

  Future addArticle(_databaseApi) async {
    Article newArticle = Article();
    newArticle.id = 1;
    newArticle.title = "# Bem-vindo ao Araci!";
    newArticle.content = "\nEste é um exemplo de texto em Markdown.  "+
        "\nTexto em **negrito**, texto em *itálico*"+
        "\n - Tópico 1  "+
        "\n - Tópico 2  ";

//    await repository.addArticle(newArticle, _databaseApi);
//    print("Article added");
  }

  initYoutubeController(){
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId(vidsList[0]),
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



}