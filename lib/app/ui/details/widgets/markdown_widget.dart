import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget markdownTitleWidget(String title) {
  return Markdown(data: title, physics: ScrollPhysics(), shrinkWrap: true,);
}

Widget markdownBodyWidget(String body){
  return Markdown(data: body, physics: ScrollPhysics(), shrinkWrap: true,);
}