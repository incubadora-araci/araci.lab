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
          child: Text("Home Page"),
        ),
      ),
      // body: RefreshIndicator(
      //   child: ListView(
      //     children: [
      //       Container(child: Center(child: Text("List Videos"),),)
      //     ],
      //   ),
      //   onRefresh: () { null;},
      // ),
      // body: Container(
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("Home Page here"),
        //     RaisedButton(onPressed: ()=> print("pressed"),child: Text("Change theme"),)
        //   ],
        // ),
    );
  }
}
