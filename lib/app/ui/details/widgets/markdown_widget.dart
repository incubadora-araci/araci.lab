import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

Widget markdownTitleWidget(String title) {
  return MarkdownBody(data: title, shrinkWrap: true,);
}

Widget markdownBodyWidget(String body){
  return MarkdownBody(
    data: body,
    shrinkWrap: true,
    onTapLink: (body,link,title){
      print("BODY CLICADO = $body");
      print("LINK CLICADO = $link");
      print("TITLE CLICADO = $title");
      Get.toNamed(Routes.WEBVIEW, arguments: {"url":link, "title":body});
    },
  );
}