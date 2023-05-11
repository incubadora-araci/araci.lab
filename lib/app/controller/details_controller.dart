import 'dart:async';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart' hide Stack;
import 'package:get/get.dart';
import 'package:stack/stack.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsController extends GetxController {

  final ArticleRepository articleRepository;
  final GlobalInformationRepository? repository;
  DetailsController({required this.articleRepository, this.repository}) : assert(articleRepository != null);
  dynamic articleId;
  dynamic articleTitle;
  dynamic articleBody;
  dynamic externalUrl;
  dynamic relatedImgPath;
  List<int> relatedIds = [];
  List<Map<String,dynamic>> relatedArticlesInformation = [];
  Stack<int?> routingStack = Stack();
  late bool isLoading;
  ScrollController scrollController = ScrollController();

  final _imgUrl = ''.obs;
  set imgUrl(value) => _imgUrl.value = value;
  get imgUrl => _imgUrl.value;

  final _displayLeading = RxBool(false);
  get displayLeading => _displayLeading.value;
  set displayLeading(value) => _displayLeading.value = value;


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
      Map<String,dynamic> article = await (articleRepository.findArticleById(id));
      relatedArticlesInformation.add({"id": id,"title":article["title"],"imgUrl":article["imgUrl"]});
    }

  }
  getArticle(int? id) async {
    relatedArticlesInformation = [];
    Map<String,dynamic> article = await (articleRepository.findArticleById(id));
    debugPrint("ARTICLE INSIDE getArticle => ${article['imgUrl']}");
    articleId = article["id"]??"";
    articleTitle = article["title"]??"";
    articleBody = article["body"]??"";
    externalUrl = article["externalUrl"];
    imgUrl = article["imgUrl"];
    //print("Loaded imgURL => $imgUrl");
    relatedIds = parseRelatedIds(article["relatedIds"]);
    if (relatedIds.length>0)await getRelatedArticles(relatedIds);
    isLoading = false;
    // print("is LOADING => $isLoading");
    updateAndScrollToTop();
  }

  pushRoute(int? id) async{
    //print("TOP OF STACK BEFORE PUSH = ${routingStack.top()}");
    routingStack.push(id);
    //print("TOP OF STACK AFTER PUSH = ${routingStack.top()}");
    await getArticle(routingStack.top());
    displayLeading = true;
  }
  popRoute() async {
    //print("TOP OF STACK BEFORE POP = ${routingStack.top()}");
    if (routingStack.length>1){
      routingStack.pop();
      await getArticle(routingStack.top());
    }
    if(routingStack.length==1){
      displayLeading = false;
    }
    //print("TOP OF STACK AFTER POP = ${routingStack.top()}");
  }

  Future<void> handleHyperLink(String url, {String? linkTitle}) async {
    if(url.contains("youtu")){
      if(repository!.getUserData("useyt")){
        handleUniversalLink(url);
      }
      else{
        Get.toNamed(Routes.VIDEO,arguments: {"url":url,"title":linkTitle});
      }
      // Get.toNamed(Routes.VIDEO,arguments: url);
    }else{
      handleUniversalLink(url);
    }
    // else if (await canLaunch(url)) {
    //   final bool nativeAppLaunchSucceeded = await launch(
    //     url,
    //     forceSafariVC: false,
    //     universalLinksOnly: true,
    //   );
    //   if (!nativeAppLaunchSucceeded) {
    //     await launch(
    //       url,
    //       forceSafariVC: true,
    //     );
    //   }
    // }
  }

  Future handleUniversalLink(String url) async {
    try {
      await launchUrl(
          Uri.parse(url),
          mode: await canLaunchUrl(Uri.parse(url)) ? LaunchMode.externalApplication : LaunchMode.platformDefault
      );
      // if (await canLaunchUrl(Uri.parse(url))) {
      //   await launchUrl(
      //     Uri.parse(url),
      //     mode: LaunchMode.externalApplication,
      //   );
      // } else {
      //   await launchUrl(
      //     Uri.parse(url),
      //   );
      // }
    } catch (e) {
      print("ERROR launching link: $e");
    }
  }
  

  handlePopMenuClick(String value) async {
    switch (value) {
      case 'Sair':
        await repository!.eraseUserInformation();
        //TODO: Delete database.
        Get.offAllNamed(Routes.SPLASH);
        break;
      case 'Configurações':
        Get.toNamed(Routes.SETTINGS);
        break;
      case 'Sobre':
        Get.toNamed(Routes.ABOUT);
        break;
      case 'Entrar':
        Get.toNamed(Routes.LOGIN);
        break;
      case 'Equipe':
        Get.toNamed(Routes.TEAM);
        break;
      case 'Backup':
        articleRepository.restoreBackup();
        Get.snackbar('Backup', 'Recuperando backup...', duration: Duration(seconds: 5),
        );
        // Delay pŕa dar tempo de restaurar a planilha antes de recarregar página
        Future.delayed(const Duration(seconds: 5), () {Get.offAllNamed(Routes.DETAILS);});
        break;
      case 'Rever Introdução':
        Get.offAllNamed(Routes.INTRO);
        break;
    }
  }

  List<int> parseRelatedIds(String relatedIdsString){
    List<int> parsedList = <int>[];
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

  // nullIfEmpty(String input){
  //   if(input.length==0){
  //     return null;
  //   }
  //   return input;
  // }

  bool isEmptyWithNullCheck(String? input){
    if(input!=null){
    debugPrint("input = $input, and is empty?: ${input.isEmpty}");
      return input.length==0;
    }
    debugPrint("The input is null");
    return true;
  }

  bool isLogged(){
    return repository!.isLogged();
  }

  bool isAdm(){
    return repository!.isAdm();
  }

  void updateAndScrollToTop() {
    scrollController.jumpTo(0);
    update();
  }
}