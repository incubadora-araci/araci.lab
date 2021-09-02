import 'package:araci/app/controller/person_controller.dart';
import 'package:araci/app/ui/talent/widget/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mais informações'), centerTitle: true,),
      body: Container(
        child: GetBuilder<PersonController>(
            init: PersonController(),
            builder: (_) {
              return SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Get.arguments.fotografia != "" ?
                      Image.network(
                          '${Get.arguments.fotografia["src"]}',
                          height: Get.height * 0.2
                      ):
                      Image.asset('assets/images/regia_araci.png',height: Get.height * .2,)
                    ),
                    Divider(height: 20.0,),
                    subTitleWidget('Nome Completo',context),
                    new ListTile(
                      title: Text('${Get.arguments.nome}'),
                    ),
                    Divider(height: 20.0,),
                    subTitleWidget('Sobre mim', context),
                    SizedBox(height: 10,),
                    ListTile(
                      title: Text('${Get.arguments.bio}'),
                    ),
                    Divider(height: 20.0,),
                    subTitleWidget('Departamento', context),
                    ListTile(
                      title: Text('${Get.arguments.departamento}'),
                    ),
                    Divider(height: 20.0,),
                    subTitleWidget('Área do Conhecimento', context),
                    ListTile(
                      title: Text('${Get.arguments.areaDoConhecimento}')
                    ),
                    Divider(height: 20.0,),
                    subTitleWidget('Contato', context),
                    ListTile(
                      leading: Icon(Icons.mail_outline),
                      title: Text('${Get.arguments.email}'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('${Get.arguments.telefone}'),
                    ),
                    // new Container(
                    //   height: 10.0,
                    // ),
                    // new ListTile(
                    //   leading: new Icon(Icons.info),
                    //   title: const Text('Rodando em'),
                    //   subtitle: new Text(_.platformVersion),
                    // ),
                    // new Divider(
                    //   height: 20.0,
                    // ),
                    // new ListTile(
                    //   leading: new Icon(Icons.info),
                    //   title: const Text('Número da Versão'),
                    //   subtitle: new Text(_.projectVersion),
                    // ),
                    // new Divider(
                    //   height: 20.0,
                    // ),
                    // new ListTile(
                    //   leading: new Icon(Icons.info),
                    //   title: const Text('Código da Versão'),
                    //   subtitle: new Text(_.projectCode),
                    // ),
                    // Divider(
                    //   height: 20.0,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child: Align(
                    //     alignment: AlignmentDirectional.centerStart,
                    //     child: Text(
                    //       'Suporte',
                    //       style: Theme.of(context).textTheme.caption,
                    //       textAlign: TextAlign.start,
                    //     ),
                    //   ),
                    // ),
                    // GestureDetector(
                    //   child: ListTile(
                    //     leading: Icon(Icons.mail, color: Colors.green[300]),
                    //     title: Text("Envie seu feedback"),
                    //   ),
                    //   onTap: _.sendMail,
                    // ),
                    // Divider(
                    //   height: 20.0,
                    // ),
                    // GestureDetector(
                    //   child: ListTile(
                    //     leading: Icon(Icons.help_center, color: Colors.green[300]),
                    //     title: Text("Manual de uso do APP"),
                    //   ),
                    //   onTap: _.openHelpUrl,
                    // ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
