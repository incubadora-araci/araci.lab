import 'package:araci/app/controller/home_controller.dart';
import 'package:araci/app/ui/home/widgets/markdown_widget.dart';
import 'package:araci/app/ui/home/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), centerTitle: true),
      body: GetBuilder<HomeController>(
        builder:(_) => RefreshIndicator(
          child: Column(
            children: [
              ytWidget(),
              Flexible(
                  child: markdownWidget("# Bem-vindo ao Araci!"+
                      "\nEste é um exemplo de texto em Markdown.  "+
                      "\nTexto em **negrito**, texto em *itálico*"+
                      "\n - Tópico 1  "+
                      "\n - Tópico 2  ")
              ),
            ],
          ),
          onRefresh: _.updateVidsList,
        ),
      )
    );
  }
  
}
