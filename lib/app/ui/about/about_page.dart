import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:araci/app/controller/about_controller.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Sobre o APP'), centerTitle: true,),

      body: Container(
        child: GetBuilder<AboutController>(
            init: AboutController(),
            builder: (_){
              return _.isLoading ? Center(child: CircularProgressIndicator() ,) : SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                          "assets/images/AraciLabLogo.png",
                          height: Get.height * 0.2
                      ),
                    ),
                    new ListTile(
                      leading: new Icon(Icons.info),
                      title: const Text('Versão do Banco de Dados'),
                      subtitle: new Text(_.projectDbversion),
                    ),
                    new Container(
                      height: 10.0,
                    ),
                    new ListTile(
                      leading: new Icon(Icons.info),
                      title: const Text('Rodando em'),
                      subtitle: new Text(_.platformVersion),
                    ),
                    new Divider(
                      height: 20.0,
                    ),
                    new ListTile(
                      leading: new Icon(Icons.info),
                      title: const Text('Nome da Versão'),
                      subtitle: new Text(_.projectVersion),
                    ),
                    new Divider(
                      height: 20.0,
                    ),
                    new ListTile(
                      leading: new Icon(Icons.info),
                      title: const Text('Código da Versão'),
                      subtitle: new Text(_.projectCode),
                    ),
                    new Divider(
                      height: 20.0,
                    ),
                    new ListTile(
                      leading: new Icon(Icons.info),
                      title: const Text('ID do App'),
                      subtitle: new Text(_.projectAppID),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}