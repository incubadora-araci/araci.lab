import 'dart:convert';
import 'package:araci/app/data/model/talent_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://talentos.uff.br/?q=api';
const nameUri = '&nome=';
const bioUri = '&bio=';
const departmentUri = '&departamento=';
const emailUri = '&email=';
const bondUri = '&vinculo=';
const expertiseUri = '&especialidades=';

class TalentApiClient {
  final http.Client httpClient;

  TalentApiClient({@required this.httpClient});

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json'
  };

  Future<TalentModel> getAll() async {
    try {
      final response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // print("JsonResponse Talent = $jsonResponse");
        return TalentModel().fromJson(jsonResponse);
      } else {
        print('Error -getAll');
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  // Future getId(id) async {
  //   try {
  //     final response = await httpClient.get(baseUrl);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  //       // TODO: implement methods!
  //     } else{
  //       print('Error -getId');
  //     }
  //   } catch (_) {}
  //   return null;
  // }

  Future<TalentModel> getFiltered({String name, String bio, String dept, String email, String bond, String expertise}) async {
    try {
      final response = await httpClient.get(baseUrl+nameUri);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return TalentModel().fromJson(jsonResponse);
      } else{
        print("Error in getFiltered call");
        print("error code = ${response.statusCode}");
        print("error body = ${response.body}");
      }
    } catch (_) {
      print("Error in getFiltered method: $_");
    }
    return null;
  }

  // Future add(obj) async {
  //   try {
  //     final response = await httpClient.post(baseUrl,
  //         headers: _defaultHeaders, body: jsonEncode(obj));
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -add');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
  //
  // Future edit(obj) async {
  //   try {
  //     final response = await httpClient.put(baseUrl,
  //         headers: _defaultHeaders, body: jsonEncode(obj));
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -edit');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
  //
  // Future delete(obj) async {
  //   try {
  //     final response = await httpClient.delete(baseUrl);
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -delete');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
}