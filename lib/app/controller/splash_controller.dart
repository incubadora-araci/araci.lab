import 'package:araci/app/data/model/article_table.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/details/details_page.dart';
import 'package:araci/app/ui/home/home_page.dart';
import 'package:araci/app/ui/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  final GlobalInformationRepository repository;
  SplashController({@required this.repository}) : assert(repository != null);

  bool isLogged;
  // @override
  // void onInit() async {
  //   super.onInit();
  // }

  @override
  void onReady() async {
    super.onReady();
    print("INSIDE ON READY");
    // await getLoginStatus();
    Future.delayed(Duration(seconds: 2), () => Get.offNamed(repository.isLogged() ? Routes.DETAILS : Routes.LOGIN));
  }
  ///Called right after bindings are done TODO:(Implement Get Middleware)
  // GetPageBuilder onPageBuildStart(GetPageBuilder page) {
  //   print('bindings are ready');
  //   return page;
  // }

  //TODO: implement login verification
  // getLoginStatus() async {
  //   print("getting login info");
  //   isLogged = await repository.getLoginStatus();
  // }



}