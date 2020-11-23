import 'package:araci/app/controller/home_controller.dart';
import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository:
          HomeRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}