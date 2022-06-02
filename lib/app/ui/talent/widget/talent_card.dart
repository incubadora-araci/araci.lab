import 'package:araci/app/controller/talent_controller.dart';
import 'package:araci/app/data/model/talent_model.dart' as TalentModel;
import 'package:araci/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

Widget talentCard(TalentModel.Node personInformation){
  final _width = Get.width;
  final _height = Get.height;

  return Column(
    children: [
      GestureDetector(
        onTap: () => Get.find<TalentController>().navigateTo(Routes.PERSON,data: personInformation),
        child: Card(
          color: Colors.red[100]!.withOpacity(0.3),
          borderOnForeground: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          elevation: 20.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                foregroundImage: (personInformation.fotografia != "" ? NetworkImage(personInformation.fotografia) : AssetImage('assets/images/regia_araci.png')) as ImageProvider<Object>?,
                radius:_width<_height? _width/8:_height/8,),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  // color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(personInformation.nome!),
                      SizedBox(height: _height/25,),
                      Text(personInformation.vinculo!,overflow: TextOverflow.visible,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: _height/20,)
    ],
  );
}

Widget notFoundWidget(){
  return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(Icons.warning_sharp),
        ),
        Text("Ops..."),
        Text("Nenhum talento encontrado."),
      ],
    );


}

Widget loadingWidget(){
  return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CircularProgressIndicator(),
        Text("Buscando talentos"),
        ],
      )
    );
}
