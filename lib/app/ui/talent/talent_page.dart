import 'package:araci/app/controller/talent_controller.dart';
import 'package:araci/app/ui/talent/widget/talent_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TalentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Talent Page'), centerTitle: true,),
      body: Container(
        child: GetBuilder<TalentController>(
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
              :ListView.builder(
                itemCount: _.talentLength,
                itemBuilder: (context,pos) => talentCard(_.talents.nodes[pos].node),
              );
            }),
      ),
    );
  }
}
