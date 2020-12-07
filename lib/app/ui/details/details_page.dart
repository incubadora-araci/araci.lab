import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/related_widget.dart';
import 'package:araci/app/ui/details/widgets/video_widget.dart';
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
            builder: (_) {
              ///TODO: Implement the logic to get data from the maps
              return Column(
                children: [
                  ConstrainedBox(
                    constraints:
                    BoxConstraints(maxHeight: 450, minHeight: 56.0),
                    child: ListView(
                      children: [
                        imageCard(_.imgPath??""),
                        SizedBox(height: 40, child: markdownTitleWidget(_.articleTitle??"")),
                        SizedBox(child: markdownBodyWidget(_.articleBody??"")
                      ],
                    ),
                  ),
                  Divider(),
                  Container(child: Markdown(data: "# Relacionados", shrinkWrap: true, physics: ScrollPhysics(),), height: 70,),
                  Expanded(
                    child: relatedArticles(),
                  )
//                  ytWidget(),
                  //TODO: Implement mini widgets for the related session
                ],
              );
            }),
      ),
    );
  }

}
