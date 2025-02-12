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
                child: ListBody(
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
                    if(!_.isURLEmpty(Get.arguments.linkArtigosTrabalhosProjetos))worksAndProjects(context, Get.arguments.linkArtigosTrabalhosProjetos),
                    // ListTile(
                    //     title: Text('${Get.arguments.linkArtigosTrabalhosProjetos}')
                    // ),
                    Divider(height: 20.0,),
                    subTitleWidget('Área do Conhecimento', context),
                    ListTile(
                      title: Text('${Get.arguments.areaDoConhecimento}')
                    ),
                    if(Get.arguments.graduacao!="") gradPos(Get.arguments.graduacao, context, 'Graduação'),
                    if(Get.arguments.posgraduacao!="")gradPos(Get.arguments.posgraduacao, context, 'Pós-Graduação'),
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

  Widget worksAndProjects(BuildContext context, String rawLinks){
    List<String> filteredLinks = Get.find<PersonController>().processLinks(rawLinks);
    return Column(
      children: [
        Divider(height: 20.0,),
        subTitleWidget('Links de trabalhos e projetos', context),
        ListView.builder(
          shrinkWrap: true,
            itemCount: filteredLinks.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: Icon(Icons.arrow_forward_ios_outlined),
                title: Text("Trabalho ${index+1}"),
                onTap: ()=> Get.find<DetailsController>().handleUniversalLink(filteredLinks[index]),
              );
            }
        ),
      ],
    );
  }

  Widget gradPos(String course, BuildContext context, String subtitle){
    return Column(
      children: [
        Divider(height: 20.0,),
        subTitleWidget(subtitle, context),
        ListTile(
          title: Text(course),
        )
      ]
    );
  }
}
