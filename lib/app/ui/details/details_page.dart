import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/ui/details/widgets/markdown_widget.dart';
import 'package:araci/app/ui/details/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: GetBuilder<DetailsController>(
            builder: (_) {
              return Column(
                children: [
                  ytWidget(),
                  markdownTitleWidget("title"),
                  markdownBodyWidget("body")
                ],
              );
            }),
      ),
    );
  }
}
