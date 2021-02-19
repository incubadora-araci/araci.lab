import 'package:araci/app/data/repository/article_repository.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart' hide Stack;
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:stack/stack.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsController extends GetxController {

  final ArticleRepository articleRepository;
  final GlobalInformationRepository globalInformationRepository;
  DetailsController({@required this.articleRepository, this.globalInformationRepository}) : assert(articleRepository != null);
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
  // get imgPath => _imgPath??"assets/images/regia_araci.png";


  @override
  void onInit() async {
    // await articleRepository.fetchData();
    if (routingStack.isEmpty) routingStack.push(1);
    await getArticle(routingStack.top());
    print("Executando onInit details -----------------------");
    // initYoutubeController();
    super.onInit();
    // addArticle();
  }

  getRelatedArticles(List<int> ids) async {
    // relatedArticlesInformation = [];
    for (int id in ids){
      Map<String,dynamic> article = await articleRepository.findArticleById(id);
      relatedArticlesInformation.add({"id": id,"title":article["title"],"imgPath":article["imgPath"]});
    }

  }
  getArticle(int id) async {
    relatedArticlesInformation = [];
    Map<String,dynamic> article = await articleRepository.findArticleById(id);
    // print("videoURL get article:::::::: ${article["videoURL"]}");
    articleId = article["id"]??"";
    articleTitle = article["title"]??"";
    articleBody = article["body"]??"";
    externalURL = article["externalURL"];
    imgPath = article["imgPath"];
    videoURL = article["videoURL"];
    relatedIds = article["related"];
    if (relatedIds!= null)await getRelatedArticles(relatedIds);
    update();
  }

  //TODO: After popping or pushing a route restart the page position to top.
  pushRoute(int id) async{
    print("TOP OF STACK BEFORE PUSH = ${routingStack.top()}");
    routingStack.push(id);
    print("TOP OF STACK AFTER PUSH = ${routingStack.top()}");
    await getArticle(routingStack.top());
  }
  popRoute() async {
    print("TOP OF STACK BEFORE POP = ${routingStack.top()}");
    if (routingStack.length>1)routingStack.pop();
    print("TOP OF STACK AFTER POP = ${routingStack.top()}");
    await getArticle(routingStack.top());
  }

  Future<dynamic> navigateNamed(String route,dynamic arguments) async {
    return await Get.toNamed(route,arguments: arguments);
  }

  Future<void> launchUniversalLink(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }
  }

  handlePopMenuClick(String value) async {
    // Get.snackbar("Função em desenvolvimento","",backgroundColor: Colors.blueGrey[900]);
    switch (value) {
      case 'Sair':
        await globalInformationRepository.eraseUserInformation();
        //TODO: Delete database.
        Get.offAllNamed(Routes.SPLASH);
        break;
      case 'Configurações':
        Get.snackbar("Função em desenvolvimento","",backgroundColor: Colors.blueGrey[900]);
        break;
      case 'Sobre':
        Get.toNamed(Routes.ABOUT);
        break;
    }
  }
}