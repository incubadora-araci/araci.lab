import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/details/widgets/article_widget.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/related_widget.dart';
import 'package:araci/app/ui/details/widgets/video_widget.dart';
import 'package:araci/app/ui/reusable_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:araci/app/ui/details/widgets/relatedcard_widget.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.mainAppBar(),
      body: WillPopScope(
        onWillPop: ()=>Get.find<DetailsController>().popRoute(),
          child: GetBuilder<DetailsController>(
//            initState: Get.find<DetailsController>().getArticle(Get.arguments),
              builder: (_) {
                return ListView(
                  children: [
                    article(_),
                    Divider(),
                    Container(child: Markdown(data: "# Relacionados",
                      shrinkWrap: true,
                      physics: ScrollPhysics(),), height: 70,),
                    if (_.externalURL != null)
                      ListTile(
                        leading: relatedCard(_.imgPath??"assets/images/regia_araci.png"),
                        title: Markdown(data: "Acesse o documento", shrinkWrap: true, physics: ScrollPhysics(),),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          print("ON TAP!!");
                          _.launchUniversalLink(_.externalURL);
                        // Get.toNamed(Routes.WEBVIEW, arguments: {"url":_.externalURL, "title":_.articleTitle});
                        }
                      ),
                    if (Get.find<DetailsController>().relatedIds != null)
                      Container(
                        child: relatedArticles(_.relatedArticlesInformation),
                    )
                  ],
                );
              }
          ),
      ),
    );
  }

}
