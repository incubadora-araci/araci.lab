import 'package:araci/app/controller/login_controller.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:get/get.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(
        LoginController(
            repository: GlobalInformationRepository(globalInformationApi: GlobalInformationApi()))
    );

    Get.put(
      FlutterAppAuth()
    );

  }
}