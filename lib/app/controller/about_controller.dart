import 'dart:io';

import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_version/get_version.dart';
import 'package:flutter/services.dart';
import 'package:araci/app/data/database/const.dart' as db;

class AboutController extends GetxController {

  String platformVersion = 'Unknown';
  String projectVersion = '';
  String projectCode = '';
  String projectDbversion = '';
  bool isLoading = true;
  String localPath;
  final ArticleRepository articleRepository = ArticleRepository(databaseApi: DatabaseApi());
  File appInfoFIle;


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
    isLoading = false;
    update();

  }

  // Mailer

  Future<File> makeAppInfo() async {
    File _appInfoFIle = File("$localPath/AppInfo.txt");
    await _appInfoFIle.writeAsString("Plataforma: $platformVersion\n");
    await _appInfoFIle.writeAsString("Versao:$projectVersion\n", mode: FileMode.append);
    await _appInfoFIle.writeAsString("Num da versao: $projectCode\n", mode: FileMode.append);
    await _appInfoFIle.writeAsString("Versao DB:$projectDbversion", mode: FileMode.append);
    return _appInfoFIle;
  }

  Future<String> makeDbDump() async {
    String csv = const ListToCsvConverter().convert(await articleRepository.dump());
    print("DUMP AS CSV -->$csv");
    return csv;
  }

  Future<String> get _getLocalPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<bool> sendMail() async {
    Get.snackbar("Carregando","Aguarde...",
        duration: Duration(seconds: 10),
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: Colors.green[300],
        backgroundColor: Colors.green[50],
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM,
        boxShadows: [BoxShadow(spreadRadius: 1, blurRadius: 1, color: Colors.black38)]);


    localPath = await _getLocalPath;
    appInfoFIle = await makeAppInfo();
    String csvDump = await makeDbDump();
    File dbInfoFIle = File("$localPath/Database.csv");
    await dbInfoFIle.writeAsString(csvDump);

    final Email email = Email(
        // body: "Banco de dados do app Covid19Epidemio",
        subject: "Feedback - App Araci.Lab",
        recipients: ["uffmobile@id.uff.br"],
        attachmentPaths: [dbInfoFIle.path, appInfoFIle.path],
        cc: ["feedback.uffmobile@gmail.com"]
    );

    try {
      await FlutterEmailSender.send(email);
      return true;
    } catch (e) {
      print('Message not sent, cause of $e');
      return false;
    }
  }


}