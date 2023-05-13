import 'dart:convert';
import 'package:araci/app/data/model/model.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

const baseUrl = 'https://script.google.com/macros/s/AKfycby_qfxOl39p-Z0CcMVL_vf6WpM8IgH_pRgM3dqNJ0atD5n8Vp2d90T4aYfcga-Pa887/exec';

class MyApiClient {
  final http.Client httpClient;

  MyApiClient(
      {required this.httpClient}
  );

  // final Map<String, String> _defaultHeaders = {
  //   'Content-Type': 'application/json'
  // };

  fetchData() async {
    final DatabaseApi dbApi = Get.find<DatabaseApi>();
    try {
      print("FETCHING DATA");
      final response = await httpClient.get(Uri.parse("$baseUrl?func=fetchData"));
      if (response.statusCode == 200) {
        await dbApi.deleteAllRows(ArticleModel().TABLE_NAME);
        var jsonResponse = jsonDecode(response.body);
        for (var jresp in jsonResponse){
          ArticleModel articleModel = ArticleModel();
          articleModel.id = jresp["id"];
          articleModel.title = jresp["title"]??"";
          articleModel.body = jresp["body"]??"";
          articleModel.externalUrl = jresp["externalUrl"]??"";
          articleModel.imgUrl = jresp["imgUrl"]??"";
          articleModel.relatedIds = jresp["relatedIds"].toString();

          await dbApi.insert(articleModel);
        }
        GetStorage().writeIfNull("firstDBLoad", false);
        // print("HERE'S THE FINAL DATABASE : ${ await dbApi.getAllMapFormat("Article")}");
      } else {
        print('Error in getAll CODE => ${response.statusCode}');
      }
    } catch (_) {
      print("Error in try $_");
      return null;
    }
    return null;
  }

  // TODO: passe o nome como parãmetro
  Future admChecking(String name) async {
    try {
      final url = Uri.parse('$baseUrl?func=isAdm&name=$name');
      // final postBody = {"name": GetStorage().read("name")};
      // TODO: passar nome como parâmetro da requisição get
      final response = await httpClient.get(url);
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse.isAdm;
    } catch (e) {
      debugPrint("(isAdm) Error: $e");
    }
  }

  restoreBackup() async {
    try {
      print("RESTORING BACKUP");
      final response = await httpClient.post(Uri.parse('$baseUrl?func=restoreBackup'));
      // TODO: passar isAdm no body
      if (response.statusCode == 200) {
        print("backup restaurado");
      } else {
        print('Error in restoreBackup CODE => ${response.statusCode}');
      }
    } catch (e) {
      print("(restoreBackup) Error: $e");
      return null;
    }
    return null;
  }
  // TODO: listar backups disponíveis
// List<int> parseRelatedIds(String relatedIdsString){
  //   List<int> parsedList = List();
  //   if(relatedIdsString.length==1){
  //     print("INSIDE LEN 1");
  //     parsedList.add(int.parse(relatedIdsString));
  //     return parsedList;
  //   }
  //   else {
  //     for (String element in relatedIdsString.split(",")){
  //       parsedList.add(int.parse(element));
  //     }
  //     return parsedList;
  //   }
  // }
}