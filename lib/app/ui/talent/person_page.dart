import 'package:araci/app/controller/details_controller.dart';
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
                          '${Get.arguments.fotografia}',
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
                    subTitleWidget('Especialidades', context),
                    ListTile(
                      title: Text('${Get.arguments.especialidades}')
                    ),
                    Divider(height: 20.0,),
                    subTitleWidget('Área do Conhecimento', context),
                    ListTile(
                      title: Text('${Get.arguments.areaDoConhecimento}')
                    ),
                    Divider(height: 20.0,),
                    subTitleWidget('Graduação', context),
                    ListTile(
                      title: Text('${Get.arguments.graduacao}'),
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
                    (_.isURLEmpty(Get.arguments.site)) ? Container() :
                    porfolio(context),
                    (_.isURLEmpty(Get.arguments.linkLattes)) ? Container () :
                    lattes(context)
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget porfolio(BuildContext context){
    return Column(
      children: [
        Divider(height: 20.0,),
        subTitleWidget("Portfólio", context),
        ListTile(
          leading: Icon(Icons.contact_page_outlined),
          title: Text('Acesse aqui'),
          onTap:()=> Get.find<DetailsController>().handleUniversalLink(Get.arguments.site),
    )
      ],
    );
  }

  Widget lattes(BuildContext context){
    return Column(
      children: [
        Divider(height: 20.0,),
        subTitleWidget("Link Lattes", context),
        ListTile(
          leading: Icon(Icons.contact_page),
          title: Text('Currículo Lattes'),
          onTap:()=> Get.find<DetailsController>().handleUniversalLink(Get.arguments.linkLattes),
        )
      ],
    );
  }
}
