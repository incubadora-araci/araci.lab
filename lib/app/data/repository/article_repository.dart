import 'dart:async';

import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:meta/meta.dart';

class ArticleRepository {
  final DatabaseApi databaseApi;
  final MyApiClient articleWebApi;

  ArticleRepository({@required this.databaseApi, this.articleWebApi}) : assert(databaseApi != null);

  FutureOr<dynamic> findArticleById(int id){
    return databaseApi.findArticleById(id);
  }

  FutureOr<dynamic> getAllArticles(){
    return databaseApi.getAllArticles();
  }

  getAll(){
    print("INSIDE GET ALL ARTICLE REPO");
    articleWebApi.getAll();
  }


//TODO: implement get methods
}

