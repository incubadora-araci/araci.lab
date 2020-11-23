import 'package:araci/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')), 
      body: Container(
        child: markdown("# Bem-vindo ao Araci!"+
        "\nEste é um exemplo de texto em Markdown.  "+
        "\nTexto em **negrito**, texto em *itálico*"+
        "\n - Tópico 1  "+
        "\n - Tópico 2  "),
//        child: Center(
//          child: Text("Home Page"),
//        ),
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
  
  Widget markdown(String data) {
    return Markdown(data: data);
  }
}
