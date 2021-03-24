import 'package:araci/app/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          GetX<SettingsController>(builder: (_)=> SwitchListTile(value: _.isSelected, onChanged: _.onChanged,title: Text("Usar tema escuro"))),
          Divider()
        ],
      )
    );
  }
}
