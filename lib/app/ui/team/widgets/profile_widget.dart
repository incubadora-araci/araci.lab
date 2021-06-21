import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

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
                  CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: AssetImage(teamMember['imgPath']??'assets/images/regia_araci.png'),),
                  SizedBox(height: _height/25.0,),
                  Text(teamMember['name'], style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                  new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8,bottom: _height/30),
                    child:new Text(teamMember['role'],style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,)
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
