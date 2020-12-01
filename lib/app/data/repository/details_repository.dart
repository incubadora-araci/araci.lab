import 'package:araci/app/data/database/database.dart';
import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/model/article_table.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:meta/meta.dart';

class DetailsRepository {
  final DatabaseApi databaseApi;

  DetailsRepository({@required this.databaseApi}) : assert(databaseApi != null);

  // updateVidsList(){
  //   return apiClient.updateVidsList();
  // }
  // getAll() {
  //   return databaseApi.getAll();
  // }
  //
  // getId(id) {
  //   return databaseApi.getId(id);
  // }
  //
  // delete(id) {
  //   return databaseApi.delete(id);
  // }
  //
  // edit(obj) {
  //   return databaseApi.edit(obj);
  // }
  //
  // add(obj) {
  //   return databaseApi.add(obj);
  // }

  // Future<List<Article>> getArticles() async {
  //   return database.getAll(Article().TABLE_NAME, Article().makeModels);
  // }
  //
  // Future addArticle(Article article) async {
  //   await database.insert(article);
  // }
}

