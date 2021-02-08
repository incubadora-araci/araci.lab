import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/image_widget.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:flutter/material.dart';

Widget article(DetailsController controller) {
    return Column(
        children: [
          // if (controller.imgPath != null) imageCard(controller.imgPath),
          // if (controller.videoURL != null) ytWidget(),
          // controller.imgPath != null ? imageCard(
          //     controller.imgPath) : Container(),
          // controller.videoURL != null ? ytWidget() : Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(child: markdownTitleWidget("# ${controller
                .articleTitle}" ?? "")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(child: markdownBodyWidget(controller.articleBody ?? "")),
          )
        ],
      );
}