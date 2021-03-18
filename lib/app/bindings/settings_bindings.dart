import 'package:araci/app/controller/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}