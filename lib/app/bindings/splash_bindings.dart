import 'package:araci/app/controller/splash_controller.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/splash_repository.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() {
      return SplashController(
          repository:
          SplashRepository());
    });
  }
}