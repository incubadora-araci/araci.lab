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
          color: Colors.red[100].withOpacity(0.3),
          borderOnForeground: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          elevation: 20.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                foregroundImage: personInformation.fotografia != "" ? NetworkImage(personInformation.fotografia["src"]) : AssetImage('assets/images/regia_araci.png'),
                radius:_width<_height? _width/8:_height/8,),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  // color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(personInformation.nome),
                      SizedBox(height: _height/25,),
                      Text(personInformation.vinculo,overflow: TextOverflow.visible,)
                    ],
                  ),
                ),
              )
            ],
          ),
          // child: Stack(
          //   children: [
          //     // Container(
          //     //   width: _width,
          //     //   height: 200,
          //     //   color: Colors.lightGreen,
          //     // ),
          //     Center(
          //       child: Column(
          //         children: [
          //           SizedBox(height: _height/12,),
          //           personInformation['squared']?
          //           Container(child: Image.asset(personInformation['imgPath']),width: _width/2,height: _height/4) :
          //           CircleAvatar(foregroundImage: AssetImage(personInformation['imgPath']??'assets/images/regia_araci.png'),radius:_width<_height? _width/4:_height/4,),
          //           SizedBox(height: _height/25.0,),
          //           Text(personInformation['name'], style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
          //           new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8,bottom: _height/30),
          //               child:new MarkdownBody(data: personInformation['role'])
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
      SizedBox(height: _height/20,)
    ],
  );


}
