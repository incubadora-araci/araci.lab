import 'package:araci/app/controller/team_controller.dart';
import 'package:araci/app/ui/team/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("Equipe Araci.lab"), centerTitle: true, automaticallyImplyLeading: true),
      body: GetBuilder<TeamController>(
          init: TeamController(),
          builder: (_){
            return ListView.builder(
              itemCount: _.teamLength,
              itemBuilder: (context,pos) => profileWidget(_.getAllMembers()[pos]),
            );
          }
      ),
    );
  }
}
