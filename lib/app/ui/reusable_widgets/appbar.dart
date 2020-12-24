import 'package:araci/app/controller/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: This appbar must be changed to Sliver or not used like a separed widget
class AppBars {
  static Widget mainAppBar() {
    return AppBar(
      actions: [
        PopupMenuButton<String>(
          // color: Colors.blueGrey[900],
          onSelected: Get.find<DetailsController>().handlePopMenuClick,
          itemBuilder: (BuildContext context) {
            return {'Sobre', 'Configurações', 'Deslogar'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.blueGrey[900],),
        onPressed: ()=> Get.find<DetailsController>().popRoute(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/regia_araci.png",
            fit: BoxFit.contain,
            height: 32,
          ),
          Text("ARACI.lab", style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.w300),)
        ],
      ),
    );
  }
}