import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  final GlobalInformationRepository repository;
  SplashController({@required this.repository}) : assert(repository != null);

  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 2), chooseNextPage);
    super.onInit();
  }

  void chooseNextPage() {
    // print("IS LOGGED STATUS => ${repository.isLogged().toString()}");
    // isLogged = storage.read("isLogged")??false;
    Get.offNamed(repository.hasSeenIntro() ? Routes.DETAILS : Routes.INTRO);
    //Get.offNamed(Routes.INTRO);
  }

}