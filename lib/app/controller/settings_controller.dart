import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class SettingsController extends GetxController {
  final GlobalInformationRepository repository = GlobalInformationRepository(globalInformationApi: GlobalInformationApi());
  final _isSelected = false.obs;
  set isSelected(value) => _isSelected.value = value;
  get isSelected => _isSelected.value;
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
  @override
  void onInit() {
    isSelected = Get.isDarkMode;
    super.onInit();
  }

  void onChanged(bool selection){
    repository.setUserData("isDarkTheme", selection);
    Get.changeTheme(Get.isDarkMode? appThemeData : appThemeDataDark);
    isSelected = selection;
    update();
  }

  // bool isDarkTheme(){
  //   return Get.isDarkMode;
  // }

}