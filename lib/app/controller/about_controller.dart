import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:flutter/services.dart';
import 'package:araci/app/data/database/const.dart' as db;

class AboutController extends GetxController {

  String platformVersion = 'Unknown';
  String projectVersion = '';
  String projectCode = '';
  String projectDbversion = '';
  bool isLoading = true;

  AboutController();

  @override
  void onInit() {
    initPlatformState();
    super.onInit();
  }

  void initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String projectVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectCode;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    String projectDbversion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectDbversion = db.VERSION.toString();
    } on PlatformException {
      projectDbversion = 'Failed to get db version.';
    }

    this.platformVersion = platformVersion;
    this.projectVersion = projectVersion;
    this.projectCode = projectCode;
    this.projectDbversion = projectDbversion;
    update();
    isLoading = false;

  }

}