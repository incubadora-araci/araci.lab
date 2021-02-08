// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login Page')),
//       body: Container(
//         child: Center(child: Text('Login Body')),
//       ),
//     );
//   }
// }

import 'package:araci/app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: GetBuilder<LoginController>(
        builder: (_){
         return  _.isBusy ?
          Center(child: CircularProgressIndicator()) :
          Container(
                child: Center(child: Text("ENTRE COM IDUFF!"),),
              );
        },
      )
    );
  }
}
