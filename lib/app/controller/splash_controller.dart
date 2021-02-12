import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  final GlobalInformationRepository repository;
  final GetStorage storage;
  SplashController({@required this.repository, this.storage}) : assert(repository != null);

  @override
  void onInit() async {
    // print("BEFORE GET INIT");
    await GetStorage.init();
    // print("AFTER GET INIT");
    Future.delayed(Duration(seconds: 2), chooseNextPage);
    super.onInit();
  }

  void chooseNextPage() {
    print("IS LOGGED STATUS => ${repository.isLogged().toString()}");
    // isLogged = storage.read("isLogged")??false;
    Get.offNamed(repository.isLogged() ? Routes.DETAILS : Routes.LOGIN);
    // Get.offNamed(Routes.DETAILS);
  }


  ///Called right after bindings are done TODO:(Implement Get Middleware)
  // GetPageBuilder onPageBuildStart(GetPageBuilder page) {
  //   print('bindings are ready');
  //   return page;
  // }

}