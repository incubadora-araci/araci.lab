import 'package:araci/app/controller/talent_controller.dart';
import 'package:araci/app/ui/talent/widget/talent_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TalentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Talentos da UFF'), centerTitle: true,),
      body: GetBuilder<TalentController>(
            init: TalentController(),
            builder: (_) {
              return _.isLoading ?
              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Buscando talentos"),
                ],
              ))
              :Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: TextField(controller: _.searchTextController,keyboardType: TextInputType.text,)),
                      IconButton(onPressed: _.fetchFilteredTalentData, icon: Icon(Icons.search_sharp))
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _.talentLength,
                      itemBuilder: (context,pos) => talentCard(_.talents.nodes[pos].node),
                    ),
                  ),
                ],
              );
            }),
    );
  }
}
