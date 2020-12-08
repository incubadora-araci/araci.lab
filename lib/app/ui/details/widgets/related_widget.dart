import 'package:araci/app/routes/app_pages.dart';
import 'package:araci/app/ui/details/widgets/relatedcard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

///TODO widget
Widget relatedArticles(List<Map<String, dynamic>> relatedList) {
  return ListView.builder(
    itemCount: relatedList.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
          leading: relatedCard(relatedList[index]["imgPath"]),
          title: Markdown(data: relatedList[index]["title"], shrinkWrap: true, physics: ScrollPhysics(),),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: ()=> Get.toNamed(Routes.DETAILS, arguments: relatedList[index]["id"])
      );
    }
  );
}