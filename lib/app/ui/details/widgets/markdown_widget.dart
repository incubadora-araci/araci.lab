import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

Widget markdownTitleWidget(String title) {
  return MarkdownBody(data: title);
}

Widget markdownBodyWidget(String body){
  return MarkdownBody(
    styleSheet: MarkdownStyleSheet(),
    data: body,
    onTapLink: (body,link,title) {
      Get.find<DetailsController>().handleHyperLink(link!,linkTitle: body);
      // Get.find<DetailsController>().navigateNamed(Routes.WEBVIEW, {"url":link, "title":body});
    }
    // onTapLink: (body,link,title){
    //   print("BODY CLICADO = $body");
    //   print("LINK CLICADO = $link");
    //   print("TITLE CLICADO = $title");
    //   Get.toNamed(Routes.WEBVIEW, arguments: {"url":link, "title":body});
    // },
  );
}