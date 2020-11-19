import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/splash_repository.dart';
import 'package:araci/app/data/repository/home_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/home/home_page.dart';
import 'package:araci/app/ui/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  final SplashRepository repository;
  SplashController({@required this.repository}) : assert(repository != null);

  Future<Widget>getLoginStatus() async {
    return await repository.getLoginStatus() ? HomePage() : LoginPage();
  }

}