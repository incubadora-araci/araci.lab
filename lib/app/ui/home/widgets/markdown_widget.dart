import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Widget markdownWidget(String data) {
  return Markdown(data: data);
}