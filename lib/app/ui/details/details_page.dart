import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/video_widget.dart';
import 'package:araci/app/ui/reusable_widgets/appbar.dart';
import 'package:flutter/material.dart';
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
                  imageCard(_.imgPath??""),
                  Expanded(
                    child: ListView(shrinkWrap: true,
                      children: [
                        Container(height: 40, child: markdownTitleWidget(_.articleTitle??"")),
                        Container(height: 100, child: markdownBodyWidget(_.articleBody??""))
                      ],
                    ),
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
