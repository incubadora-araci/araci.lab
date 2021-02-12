import 'dart:convert';
import 'package:araci/app/data/model/article_table.dart';
import 'package:araci/app/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

const baseUrl = 'https://script.google.com/macros/s/AKfycbxNHIMDuJHlfGTvWK_gsnjRX_eng917MJNbZ6W0D8DbxT0AsAWJX1Xk3A/exec';

class MyApiClient {
  final http.Client httpClient;

  MyApiClient(
      {@required this.httpClient}

  );

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json'
  };

  fetchData() async {
    try {
      print("INSIDE TRY GET ALL");
      final response = await httpClient.get(baseUrl);
      List<ArticleModel> articleList = List<ArticleModel>();
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        for (var jresp in jsonResponse){
          print("ELEMENT => $jresp");
          ArticleModel articleModel = ArticleModel();
          articleModel.id = jresp["id"];
          articleModel.title = jresp["title"];
          articleModel.body = jresp["body"];
          articleModel.externalUrl = jresp["externalUrl"];
          articleModel.imgUrl = jresp["imgUrl"];
          articleModel.relatedIds = jresp["relatedIds"];

          //Instead of adding to this list, add directly to DB
          articleList.add(articleModel);
        }
        //add the articleList to DB
        print("ALL LIST ==>> $articleList");
        // return jsonResponse['data']
        //     .map((json) => ArticleModel.fromJson(json))
        //     .toList();
      } else {
        print('Error in getAll CODE => ${response.statusCode}');
      }
    } catch (_) {}
    return null;
  }

  Future getId(id) async {
    try {
      final response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // TODO: implement methods!
      } else{
        print('Error -getId');
      }
    } catch (_) {}
    return null;
  }

  Future add(obj) async {
    try {
      final response = await httpClient.post(baseUrl,
          headers: _defaultHeaders, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else {
        print('Error -add');
      }
    } catch (_) {}
    return null;
  }

  Future edit(obj) async {
    try {
      final response = await httpClient.put(baseUrl,
          headers: _defaultHeaders, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else {
        print('Error -edit');
      }
    } catch (_) {}
    return null;
  }

  Future delete(obj) async {
    try {
      final response = await httpClient.delete(baseUrl);
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else {
        print('Error -delete');
      }
    } catch (_) {}
    return null;
  }
}