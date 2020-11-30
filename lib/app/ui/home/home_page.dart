import 'package:araci/app/controller/home_controller.dart';
import 'package:araci/app/data/repository/home_repository.dart';
import 'package:araci/app/ui/home/widgets/card_widget.dart';
import 'package:araci/app/ui/home/widgets/markdown_widget.dart';
import 'package:araci/app/ui/home/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder:(_) => RefreshIndicator(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    homeCardWidget("Card 1", ()=> Get.snackbar("Card 1", "Card 1 selecionado", snackPosition: SnackPosition.BOTTOM), context),
                    homeCardWidget("Card 2", ()=> Get.snackbar("Card 2", "Card 2 selecionado", snackPosition: SnackPosition.BOTTOM), context),
                    homeCardWidget("Card 3", ()=> Get.snackbar("Card 3", "Card 3 selecionado", snackPosition: SnackPosition.BOTTOM), context),
                    homeCardWidget("Card 4", ()=> Get.snackbar("Card 4", "Card 4 selecionado", snackPosition: SnackPosition.BOTTOM), context),
                    homeCardWidget("Card 5", ()=> Get.snackbar("Card 5", "Card 5 selecionado", snackPosition: SnackPosition.BOTTOM), context),
                    homeCardWidget("Card 6", ()=> Get.snackbar("Card 6", "Card 6 selecionado", snackPosition: SnackPosition.BOTTOM), context)
                  ],
                ),
              )
            ],
          ),
          onRefresh: _.updateVidsList,
        ),
      ),
    );
  }
  
}
