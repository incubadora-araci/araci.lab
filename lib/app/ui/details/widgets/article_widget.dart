import 'dart:async';

import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:flutter/material.dart';

Widget article(Map<String, dynamic> info) {
    return Column(
      children: [
        info["imgPath"] != null ?
        imageCard(info["imgPath"]) : imageCard("assets/images/regia_araci.png") ,
        ///TODO: Correct errors in youtube widget
        //ytWidget(),
        Expanded(
          child: ListView(shrinkWrap: true,
            children: [
              Container(height: 40, child: markdownTitleWidget(info["title"]),),
              Container(height: 100, child: markdownBodyWidget(info["body"]))
            ],
          ),
        )
//
        //TODO: Implement mini widgets for the related session
      ],
    );
}