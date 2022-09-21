import 'package:araci/app/controller/talent_controller.dart';
import 'package:araci/app/ui/talent/widget/talent_card.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TalentPage extends GetView<TalentController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TalentController>(
      init: TalentController(),
      builder: (c) {
      return Scaffold(
        appBar: EasySearchBar(
          title: Center(child: Text('Talentos da UFF')),
          suggestions: c.skillMap.keys.toList(),
          onSuggestionTap: (skill){c.fetchFilteredTalentData(skill);},
          searchHintText: 'Digite e selecione uma especilidade',
          isFloating: true,
          searchBackgroundColor: Colors.white,
          searchCursorColor: Colors.lightGreen,
          searchTextStyle: TextStyle(color: Colors.black),
          elevation: 8.0,
          onSearch: (skill){},
        ),
        body: controller.isLoading ? loadingWidget()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.talentLength == 0 ? notFoundWidget() :
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.talentLength,
                      itemBuilder: (context, pos) =>
                          talentCard(controller.talents!.nodes![pos].node!),
                    ),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: c.fetchTalentData
        ),
      );
    });
  }
}
