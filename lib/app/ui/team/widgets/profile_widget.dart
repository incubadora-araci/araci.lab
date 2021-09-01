import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

Widget profileWidget(Map<String, dynamic> teamMember){
  final _width = Get.width;
  final _height = Get.height;

  return Column(
    children: [
      Card(
        color: Colors.lightGreen.withOpacity(0.3),
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
        elevation: 20.0,
        child: Stack(
          children: [
            // Container(
            //   width: _width,
            //   height: 200,
            //   color: Colors.lightGreen,
            // ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: _height/12,),
                  teamMember['squared']?
                  Container(child: Image.asset(teamMember['imgPath']),width: _width/2,height: _height/4) :
                  CircleAvatar(foregroundImage: AssetImage(teamMember['imgPath']??'assets/images/regia_araci.png'),radius:_width<_height? _width/4:_height/4,),
                  SizedBox(height: _height/25.0,),
                  Text(teamMember['name'], style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                  new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8,bottom: _height/30),
                    child:new MarkdownBody(data: teamMember['role'])
                  )
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(height: _height/12,)
    ],
  );


}
