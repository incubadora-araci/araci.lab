import 'package:flutter/material.dart';

Widget homeCardWidget(String content, Function onTap, BuildContext context) {
  return Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: onTap,
      child: Container(
        width: 300,
        height: 200,
        child: Container(
          height: MediaQuery.of(context).size.height/6,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(content, style: TextStyle(color: Colors.black), textScaleFactor: 1.4,),
          ),
        ),

      ),
    ),
  );
}