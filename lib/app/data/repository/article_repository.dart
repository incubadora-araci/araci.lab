import 'dart:async';

import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/data/model/model.dart';
import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ArticleRepository {
  final DatabaseApi databaseApi;
  final MyApiClient articleWebApi;

  ArticleRepository({@required this.databaseApi, this.articleWebApi}) : assert(databaseApi != null);

  FutureOr<dynamic> findArticleById(int id) async {
    return await databaseApi.getArticleById(id);
  }

  FutureOr<dynamic> getAllArticles(){
    return databaseApi.getAllArticles();
  }

  fetchData() async {
    // Get.find<DetailsController>().isLoading = true;
    // print("INSIDE GET ALL ARTICLE REPO");
    await articleWebApi.fetchData();
  }

  Future<List<List<Map<String,dynamic>>>> dump() async {
    List<List<Map<String, dynamic>>> dbDump = [];
    dbDump.add(await databaseApi.getAllMapFormat(ArticleModel().TABLE_NAME));
    return dbDump;
  }


}

