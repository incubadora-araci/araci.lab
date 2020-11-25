import 'package:araci/app/data/database/database.dart';
import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/model/article_table.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final MyApiClient apiClient;
  AppDatabase database;

  HomeRepository({@required this.apiClient}) : assert(apiClient != null);


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

  Future<List<Article>> getArticles() async {
    await database.init();
    return database.getAll(Article().TABLE_NAME, Article().makeModels);
  }

  Future addArticle(Article article) async {
    await database.init();
    await database.insert(article);
  }
}

