import 'dart:convert';
import 'package:araci/app/data/model/talent_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://talentos.uff.br/?q=cinema';
const nameUri = '&nome=';
const bioUri = '&bio=';
const departmentUri = '&departamento=';
const emailUri = '&email=';
const bondUri = '&vinculo=';
const expertiseUri = '&especialidades=';
// const cinema1 = '&graduacao=108646';
// const cinema2 = '&graduacao=1169811';
// const baseCinemaUrl = baseUrl+cinema1;

class TalentApiClient {
  final http.Client httpClient;

  TalentApiClient({required this.httpClient});

  Future<TalentModel?> getAll() async {
    try {
      final response = await httpClient.get(Uri.parse(baseUrl));
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

  Future<TalentModel?> getFiltered({String? name, String? bio, String? dept, String? email, String? bond, String? expertise}) async {
    String getUrl = "$baseUrl$nameUri${name??''}$bioUri${bio??''}$departmentUri${dept??''}$emailUri${email??''}$bondUri${bond??''}$expertiseUri${expertise??''}";
    debugPrint("url = $getUrl");
    try {
      final response = await httpClient.get(Uri.parse(getUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return TalentModel().fromJson(jsonResponse);
      } else{
        debugPrint("Error in getFiltered call");
        debugPrint("error code = ${response.statusCode}");
        debugPrint("error body = ${response.body}");
      }
    } catch (_) {
      print("Error in getFiltered method: $_");
    }
    return null;
  }

}