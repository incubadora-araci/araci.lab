import 'package:araci/app/controller/backup_controller.dart';
import 'package:araci/app/data/provider/article_api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BackupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<BackupController>(
      BackupController(repository: ArticleRepository(databaseApi: DatabaseApi(), articleWebApi: MyApiClient(httpClient: http.Client()))),);
  }
}
