import 'package:flutter/material.dart';

Widget homeCardWidget(String content, String imageName, Function onTap, BuildContext context) {
    return Card(
        elevation: 3,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageName),
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
            child: Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(content, style: TextStyle(color: Colors.black), textScaleFactor: 1.4,),
              ),
            )
          ),
        )
    );
//  return Card(
//    semanticContainer: true,
//    clipBehavior: Clip.antiAliasWithSaveLayer,
//    child: InkWell(
//      splashColor: Colors.blue.withAlpha(30),
//      onTap: onTap,
//      child: Container(
//        width: 300,
//        height: 200,
//        child: Container(
//          height: MediaQuery.of(context).size.height/6,
//          width: MediaQuery.of(context).size.width,
//
//          child: Stack(
//            children: [
//              Image.asset(imageName, fit: BoxFit.fill,),
//              Container(
//                alignment: Alignment.topCenter,
//                child: Padding(
//                  padding: const EdgeInsets.all(20.0),
//                  child: Text(content, style: TextStyle(color: Colors.black), textScaleFactor: 1.4,),
//                ),
//              )
//            ],
//          )
//        ),
//
//      ),
//    ),
//  );
}