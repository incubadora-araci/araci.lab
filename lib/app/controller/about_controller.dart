import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:flutter/services.dart';
import 'package:araci/app/data/database/const.dart' as db;

class AboutController extends GetxController {

  String platformVersion = 'Unknown';
  String projectVersion = '';
  String projectCode = '';
  String projectAppID = '';
  String projectDbversion = '';
  bool isLoading = true;


  AboutController();

  //final _obj = ''.obs;
  //set obj(value) => this._obj.value = value;
  //get obj => this._obj.value;

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

    String projectAppID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
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
    this.projectAppID = projectAppID;
    this.projectDbversion = projectDbversion;
    update();
    isLoading = false;

  }

}