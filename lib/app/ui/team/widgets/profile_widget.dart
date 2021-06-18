import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

Widget profileWidget(Map<String, dynamic> teamMember){
  final _width = Get.width;
  final _height = Get.height;

  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50.0))),
    child: new Stack(children: <Widget>[
      new Container(color: Colors.black,),
      Image.asset(teamMember['imgPath']??'assets/images/regia_araci.png'),
      new BackdropFilter(
          filter: new ui.ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: new Container(
            decoration: BoxDecoration(
              color:  Colors.lightGreen,
              // borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),)),
      new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: AssetImage(teamMember['imgPath']??'assets/images/regia_araci.png'),),
                new SizedBox(height: _height/25.0,),
                new Text(teamMember['name'], style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child:new Text(teamMember['role'],
                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                // new Divider(height: _height/30,color: Colors.white,),
                // new Row(
                //   children: <Widget>[
                //     rowCell(343, 'POSTS'),
                //     rowCell(673826, 'FOLLOWERS'),
                //     rowCell(275, 'FOLLOWING'),
                //   ],),
                // new Divider(height: _height/30,color: Colors.white),
                // new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){},
                //   child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                //     new Icon(Icons.person),
                //     new SizedBox(width: _width/30,),
                //     new Text('FOLLOW')
                //   ],)),color: Colors.blue[50],),),
                new SizedBox(height: _height/6,),
              ],
            ),
          )
      )
    ],),
  );
}
