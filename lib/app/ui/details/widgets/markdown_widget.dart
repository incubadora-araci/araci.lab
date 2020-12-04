import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget markdownTitleWidget(String title) {
  return Markdown(data: title);
}

Widget markdownBodyWidget(String body){
  return Markdown(data: body);
}