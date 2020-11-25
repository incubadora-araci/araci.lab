import 'package:araci/app/controller/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details page title'), centerTitle: true,),
      body: Container(
        child: GetX<DetailsController>(
            builder: (_) {
              return Container(child: Center(child: Text("Details page"),),);
            }),
      ),
    );
  }
}
