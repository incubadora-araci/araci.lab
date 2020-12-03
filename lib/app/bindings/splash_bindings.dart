import 'package:araci/app/controller/home_controller.dart';
import 'package:araci/app/controller/splash_controller.dart';
import 'package:araci/app/data/database/database.dart';
import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(
          repository: GlobalInformationRepository(globalInformationApi: GlobalInformationApi()))
    );

    Get.putAsync<GetStorage>(() async {
      await GetStorage.init();
      final storage = GetStorage();
      storage.write("isLogged", true);
      return storage;
    },
      permanent: true
    );

    Get.put<HomeController>(
        HomeController(
            repository: ArticleRepository(databaseApi: DatabaseApi()))
    );

    // Get.lazyPut<HomeController>(() {
    //   return HomeController(
    //       repository:
    //       HomeRepository(apiClient: MyApiClient(httpClient: http.Client())));
    // });
  }
}