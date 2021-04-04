import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class SettingsController extends GetxController {
  final GlobalInformationRepository repository = GlobalInformationRepository(globalInformationApi: GlobalInformationApi());
  final _isSelected = false.obs;
  set isSelectedTheme(value) => _isSelected.value = value;
  get isSelectedTheme => _isSelected.value;

  final _useYTValue = false.obs;
  get useYTValue => _useYTValue.value;
  set useYTValue(val) => _useYTValue.value = val;


  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
  @override
  void onInit() {
    useYTValue = repository.getUserData("useyt");
    isSelectedTheme = Get.isDarkMode;
    super.onInit();
  }

  void onChanged(bool selection){
    repository.setUserData("isDarkTheme", selection);
    Get.changeTheme(Get.isDarkMode? appThemeData : appThemeDataDark);
    isSelectedTheme = selection;
    update();
  }

  void onChangeYTAPP(bool selection){
    repository.setUserData("useyt", selection);
    useYTValue = selection;
  }

  // bool isDarkTheme(){
  //   return Get.isDarkMode;
  // }

}