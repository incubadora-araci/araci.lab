import 'package:araci/app/controller/talent_controller.dart';
import 'package:araci/app/ui/talent/widget/talent_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:backdrop/backdrop.dart';

class TalentPage extends GetView<TalentController> {
  @override
  Widget build(BuildContext context) {
    debugPrint("CONTEXT = " + context.toString());
    return GetBuilder<TalentController>(
      init: TalentController(),
      builder: (_) {
      return BackdropScaffold(
        stickyFrontLayer: true,
        appBar: BackdropAppBar(
          title: Text('Talentos da UFF'), centerTitle: true,
          actions: <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.search_ellipsis
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), onPressed: () => Get.back(),),
        ),
        frontLayer:
        controller.isLoading ? loadingWidget()
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
        backLayer: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Get.theme.accentColor,
                        controller: controller.nameTextController,
                        decoration: InputDecoration(
                            labelText: 'Nome',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Get.theme.accentColor,
                        controller: controller.skillTextController,
                        decoration: InputDecoration(
                            labelText: 'Uma Habilidade',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    ),
                    // IconButton(onPressed: controller.fetchFilteredTalentData,
                    //     icon: Icon(Icons.search_sharp))
                  ],
                ),
              ],
            ),
        onBackLayerConcealed: (){
          //print("back layer concealed");
          controller.fetchFilteredTalentData();
        },
      );
    });
  }
}
