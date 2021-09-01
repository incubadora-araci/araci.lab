import 'package:araci/app/controller/person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Page')),
      body: Container(
        child: GetX<PersonController>(
            init: PersonController(),
            builder: (_) {
              return Center(child: Text("Person more information will be here"),);
            }),
      ),
    );
  }
}
