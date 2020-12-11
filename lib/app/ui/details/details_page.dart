import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/related_widget.dart';
import 'package:araci/app/ui/reusable_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.mainAppBar(),
      body: Container(
        child: GetBuilder<DetailsController>(
            initState: (_) => Get.find<DetailsController>().getArticle(Get.arguments??1),
//            initState: Get.find<DetailsController>().getArticle(Get.arguments),
            builder: (_) {
              ///TODO: Implement the logic to get data from the maps
              return Column(
                children: [
                  ConstrainedBox(
                    constraints:
                    BoxConstraints(maxHeight: Get.height*(2/4), minHeight: Get.height*(1/4)),
                    child: ListView(
                      children: [
                        imageCard(
                            _.imgPath ?? "assets/images/regia_araci.png"),
                        SizedBox(height: 40, child: markdownTitleWidget("# ${_
                            .articleTitle}" ?? "")),
                        SizedBox(child: markdownBodyWidget(_.articleBody ?? ""))
                      ],
                    ),
                  ),
                  Divider(),
                  Container(child: Markdown(data: "# Relacionados",
                    shrinkWrap: true,
                    physics: ScrollPhysics(),), height: 70,),
                  Expanded(
                    child: relatedArticles(_.relatedArticlesInformation),
                  )
                ],
              );
            }),
      ),
    );
  }

}
