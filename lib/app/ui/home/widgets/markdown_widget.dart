import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget markdownWidget(String title, String content) {
  return Markdown(data: "$title" + "\n$content");
}