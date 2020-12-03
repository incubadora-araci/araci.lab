import 'package:araci/app/controller/home_controller.dart';
import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/repository/article_repository.dart';
import 'package:araci/app/ui/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:araci/app/ui/home/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  int _activeIndex = 0;
  final _widgetOptions = [
    Container(),
    Container(),
    Container()
  ];

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
              buildList(context: context),
            ],
          ),
          onRefresh: _.updateVidsList,
        ),
      ),
//      bottomNavigationBar: bottomNavigationBar([Icons.home, Icons.list, Icons.person],
//          _activeIndex, _onItemTapped)
    );
  }

  ///CORRIGIR ISSO AQUI
  void _onItemTapped() {
    ///TODO: implementação do onTap do navigationBar
  }
}
