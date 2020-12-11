import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/video_widget.dart';
import 'package:flutter/material.dart';

Widget article(DetailsController controller) {
    return ConstrainedBox(
      constraints:
      BoxConstraints(maxHeight: 450, minHeight: 56.0),
      child: ListView(
        children: [
          controller.imgPath != null ? imageCard(
              controller.imgPath) : Container(),
          controller.videoURL != null ? ytWidget() : Container(),
          SizedBox(height: 40, child: markdownTitleWidget("# ${controller
              .articleTitle}" ?? "")),
          SizedBox(child: markdownBodyWidget(controller.articleBody ?? ""))
        ],
      ),
    );
}