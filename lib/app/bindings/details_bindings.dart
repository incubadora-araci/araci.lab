import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:get/get.dart';


class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          articleRepository: ArticleRepository(databaseApi: DatabaseApi()),
          globalInformationRepository: GlobalInformationRepository(globalInformationApi: GlobalInformationApi())
      );
    });
  }
}