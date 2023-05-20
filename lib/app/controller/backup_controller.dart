import 'package:araci/app/data/repository/article_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackupController extends GetxController {

  final ArticleRepository repository;
  BackupController({required this.repository}) : assert(repository != null);
  bool isLoading = true;

  List backupList = [];

  @override
  Future<void> onInit() async {
    try {
      backupList = await repository.getBackups();
    } catch(e) {
      debugPrint("(BackupController) error: $e");
    }
    isLoading = false;
    update();
    super.onInit();
  }

  restoreBackup(String backup) async {
    await repository.restoreBackup(backup);
  }

  createBackup() async {
    await repository.createBackup();
  }
}