import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: ()=> Get.back(),
            ),
            title: MarkdownBody(data: "# "+Get.arguments["title"]),
        ),
        body: WebView(initialUrl: Get.arguments["url"])
    );
  }
}