import 'package:araci/app/controller/backup_controller.dart';
import 'package:araci/app/data/provider/article_api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BackupPage extends GetView<BackupController> {
  const BackupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backup'),
        centerTitle: true,actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen, ),
            child: Row(
              children: [
                Text('Criar', style: TextStyle(color: Colors.white)),
                Icon(Icons.add_box_rounded),
              ],
            ),
            onPressed: () async {
              bool confirmed = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    title: Text('Criar Backup?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent,),
                        child: Text('Cancelar', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,),
                        child: Text('Criar', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                },
              );
              if (confirmed) {
                // Mostra um popup
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.lightGreen,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text('Criando Backup...',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                        ),
                      ],
                    ),
                  ),
                );
                await controller.createBackup();
                Navigator.of(context).pop();
                Get.offAllNamed(Routes.DETAILS);
              }
            },
          ),
        ]
      ),

      body: Container(
        child: GetBuilder<BackupController>(
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
                        bool confirmed = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.lightGreen,
                              title: Text('Restaurar: "${_.backupList[index]}"?'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent,),
                                  child: Text('Cancelar', style: TextStyle(color: Colors.white)),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,),
                                  child: Text('Restaurar', style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            );
                          },
                        );
                        if (confirmed) {
                          // Mostra um popup
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.lightGreen,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(height: 10),
                                  Text('Restaurando dados...',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                                  ),
                                ],
                              ),
                            ),
                          );
                          await _.restoreBackup(_.backupList[index]);
                          Navigator.of(context).pop(); // Fecha o popup depois de resturar
                          Get.offAllNamed(Routes.DETAILS);
                        }
                      },
                    );
                  },
                );
            }),
      ),
    );
  }
}
