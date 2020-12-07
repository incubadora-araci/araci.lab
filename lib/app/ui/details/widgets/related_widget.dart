import 'package:araci/app/ui/details/widgets/relatedcard_widget.dart';
import 'package:araci/app/ui/size_config.dart';
import 'package:flutter/material.dart';

///TODO widget
Widget relatedArticles() {
  return ListView(
    children: [
      ListTile(
        leading: relatedCard("assets/testImages/VR.jpg"),
        title: Text("Volta Redonda"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      Container(
        height: 15
      ),
      ListTile(
        leading: relatedCard("assets/images/regia_araci.png"),
        title: Text("Atari"),
        trailing: Icon(Icons.arrow_forward_ios),
      )
    ],
  );
}