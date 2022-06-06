import 'package:araci/app/controller/details_controller.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/details/widgets/relatedcard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

Widget relatedArticles(List<Map<String, dynamic>> relatedList) {
  return Container(
    child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // Property to solve scroll problems***
      shrinkWrap: true,
      itemCount: relatedList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: relatedCard(Get.find<DetailsController>().isEmptyWithNullCheck(relatedList[index]["imgUrl"]) ? "assets/images/regia_araci.png" : relatedList[index]["imgUrl"]),
            title: Markdown(data: relatedList[index]["title"]??"", shrinkWrap: true, physics: ScrollPhysics(),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {Get.find<DetailsController>().pushRoute(relatedList[index]["id"]);}
        );
      }
    ),
  );
}