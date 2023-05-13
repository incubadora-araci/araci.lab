import 'package:araci/app/data/provider/global_information.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class GlobalInformationRepository {
  final GlobalInformationApi globalInformationApi;

  GlobalInformationRepository({required this.globalInformationApi}) : assert(globalInformationApi != null);

  bool isLogged(){
    return globalInformationApi.getGlobalInformation("isLogged");
  }

  bool isAdm(){
    return globalInformationApi.getGlobalInformation("isAdm");
  }

  dynamic getUserData(String key){
    return globalInformationApi.getGlobalInformation(key);
  }

  dynamic setUserData(String key,value){
    globalInformationApi.setGlobalInformation(key, value);
  }

  dynamic setUserInformation(String fullName, String email, String iduff, bool isLogged) async {
    await globalInformationApi.setGlobalInformation("fullName", fullName);
    await globalInformationApi.setGlobalInformation("email", email);
    await globalInformationApi.setGlobalInformation("iduff", iduff);
    await globalInformationApi.setGlobalInformation("isLogged", isLogged);
  }

  getUrl(String name){
    return globalInformationApi.getUrl(name);
  }

  eraseUserInformation() async {
    await globalInformationApi.eraseUserInformation();
  }

  hasSeenIntro(){
    return globalInformationApi.getGlobalInformation("hasSeenIntro");
  }

  sawIntro(){
    globalInformationApi.setGlobalInformation("hasSeenIntro", true);
  }

}

class APICredentials {
  String? authUrl;
  String? authToken;
  String? authenticate;
  String? client;
  String? secretHomolog;
  String? secretProd;

  Future<void> loadApiCredentials(path) async {
    String jsonString = await rootBundle.loadString(path);
    dynamic data = json.decode(jsonString);
    this.authUrl = data["auth-server-url"];
    this.authToken = data["auth-server-token"];
    this.authenticate = data["auth-server-authenticate"];
    this.client = data["client"];
    this.secretHomolog = data["secret-homolog"];
    this.secretProd = data["secret-prod"];

  }
}

