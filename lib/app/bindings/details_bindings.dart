import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:get/get.dart';


class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository:
          ArticleRepository(databaseApi: DatabaseApi()));
    });
  }
}