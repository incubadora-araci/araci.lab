import 'package:araci/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Container(
        child: Center(
          child: Text("HOME PAGE HERE!!!"),
        ),
//        child: GetX<HomeController>(
//            init: HomeController(),
//            builder: (_) {
//              return Container(
//                child: Center(
//                  child: Text("HOME PAGE"),
//                ),
//              );
//            }),
      ),
    );
  }
}
