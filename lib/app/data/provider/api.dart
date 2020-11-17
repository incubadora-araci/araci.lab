import 'dart:convert';
import 'package:araci/app/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class MyApiClient {
  final http.Client httpClient;

  MyApiClient(
      {@required this.httpClient}

  );

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json'
  };

  Future<List<ApiModel>> getAll() async {
    try {
      final response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']
            .map((json) => ApiModel.fromJson(json))
            .toList();
      } else {
        print('Error -getAll');
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