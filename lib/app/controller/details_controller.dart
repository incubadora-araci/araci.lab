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
  final GlobalInformationRepository repository;
  DetailsController({@required this.articleRepository, this.repository}) : assert(articleRepository != null);
  dynamic articleId;
  dynamic articleTitle;
  dynamic articleBody;
  dynamic externalUrl;
  final _imgUrl = ''.obs;
  dynamic relatedImgPath;
  List<int> relatedIds = [];
  List<Map<String,dynamic>> relatedArticlesInformation = [];
  Stack<int> routingStack = Stack();
  bool isLoading;
  set imgUrl(value) => _imgUrl.value = value;
  get imgUrl => _imgUrl.value;

  @override
  void onInit() async {
    isLoading = true;
    await articleRepository.fetchData();
    if (routingStack.isEmpty) routingStack.push(1);
    await getArticle(routingStack.top());
    print("Executando onInit details -----------------------");
    super.onInit();
  }

  getRelatedArticles(List<int> ids) async {
    for (int id in ids){
      Map<String,dynamic> article = await articleRepository.findArticleById(id);
      relatedArticlesInformation.add({"id": id,"title":article["title"],"imgUrl":nullIfEmpty(article["imgUrl"])});
    }

  }
  getArticle(int id) async {
    relatedArticlesInformation = [];
    Map<String,dynamic> article = await articleRepository.findArticleById(id);
    // print("ARTICLE INSIDE getArticle => $article");
    articleId = article["id"]??"";
    articleTitle = article["title"]??"";
    articleBody = article["body"]??"";
    externalUrl = nullIfEmpty(article["externalUrl"]);
    imgUrl = nullIfEmpty(article["imgUrl"]);
    print("Loaded imgURL => $imgUrl");
    relatedIds = parseRelatedIds(article["relatedIds"]);
    if (relatedIds.length>0)await getRelatedArticles(relatedIds);
    isLoading = false;
    print("is LOADING => $isLoading");
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
    if (routingStack.length>1){
      routingStack.pop();
      await getArticle(routingStack.top());
    }
    print("TOP OF STACK AFTER POP = ${routingStack.top()}");
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
    switch (value) {
      case 'Sair':
        await repository.eraseUserInformation();
        //TODO: Delete database.
        Get.offAllNamed(Routes.SPLASH);
        break;
      case 'Configurações':
        Get.snackbar("Função em desenvolvimento","",backgroundColor: Colors.lightGreen);
        break;
      case 'Sobre':
        Get.toNamed(Routes.ABOUT);
        break;
      case 'Entrar':
        Get.toNamed(Routes.LOGIN);
        break;
      case 'Rever Introdução':
        Get.offAllNamed(Routes.INTRO);
        break;
    }
  }

  List<int> parseRelatedIds(String relatedIdsString){
    List<int> parsedList = List();
    if(relatedIdsString.length==0){
      return parsedList;
    }
    else if(relatedIdsString.length==1){
      parsedList.add(int.parse(relatedIdsString));
      return parsedList;
    }
    else {
      for (String element in relatedIdsString.split(",")){
        parsedList.add(int.parse(element));
      }
      return parsedList;
    }
  }

  nullIfEmpty(String input){
    if(input.length==0){
      return null;
    }
    return input;
  }

  bool isLogged(){
    return repository.isLogged();
  }
}