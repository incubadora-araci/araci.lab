import 'package:araci/app/data/database/database.dart';
import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/model/article_table.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final MyApiClient apiClient;
  DatabaseApi databaseApi;
  List<Article> _articleList = [];

  HomeRepository({@required this.apiClient, @required this.databaseApi}) : assert(apiClient != null);

  updateVidsList(){
    return apiClient.updateVidsList();
  }
  getAll() {
    return apiClient.getAll();
  }

  getId(id) {
    return apiClient.getId(id);
  }

  delete(id) {
    return apiClient.delete(id);
  }

  edit(obj) {
    return apiClient.edit(obj);
  }

  add(obj) {
    return apiClient.add(obj);
  }

  Future<List<Article>> getArticles(DatabaseApi databaseApi) async {
    databaseApi = await databaseApi.init();
    return databaseApi.getAll(Article().TABLE_NAME, Article().makeModels);
  }

  Future addArticle(Article article, DatabaseApi databaseApi) async {
    databaseApi= await databaseApi.init();
    await databaseApi.insert(article);
  }

  Future<String> getTitle() async {
    return _articleList[0].title;
  }

  Future<String> getContent() async {
    return _articleList[0].content;
  }
}

