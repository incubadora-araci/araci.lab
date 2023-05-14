import 'package:araci/app/controller/backup_controller.dart';
import 'package:araci/app/data/provider/article_api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BackupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Backup'), centerTitle: true,),

      body: Container(
        child: GetBuilder<BackupController>(
            // TODO: criar backup binding
            init: BackupController(articleRepository: ArticleRepository(databaseApi: DatabaseApi(), articleWebApi: MyApiClient(httpClient: http.Client()))),
            builder: (_){
              return _.isLoading ?
                Center(child: CircularProgressIndicator(),) :
                ListView.builder(
                  itemCount: _.backupList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: new Icon(Icons.refresh),
                      title: Text(_.backupList[index]),
                      subtitle: Text("Clique para restaurar"),
                      onTap: () async {
                        Get.snackbar('Backup', 'Restaurando dados...', duration: Duration(seconds: 5));
                        await _.restoreBackup(_.backupList[index]);
                        Get.offAllNamed(Routes.DETAILS);
                      },
                    );
                  },
                );
            }),
      ),
    );
  }
}
