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
          GetX<SettingsController>(builder: (_)=> SwitchListTile(value: _.isSelectedTheme, onChanged: _.onChanged,title: Text("Usar tema escuro"),activeColor: Colors.lightGreen,)),
          Divider(),
          GetX<SettingsController>(builder: (_)=> SwitchListTile(value: _.useYTValue, onChanged: _.onChangeYTAPP,title: Text("Usar app do YouTube"),activeColor: Colors.lightGreen,subtitle: Text("Ativo: será aberto o aplicativo do YouTube para assistir os filmes. \n Inativo: Os filmes poderão ser visto dentro do Araci.lab."),))
        ],
      )
    );
  }
}
