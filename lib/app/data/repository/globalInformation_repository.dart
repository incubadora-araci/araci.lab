import 'package:araci/app/data/provider/global_information.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class GlobalInformationRepository {
  final GlobalInformationApi globalInformationApi;

  GlobalInformationRepository({@required this.globalInformationApi}) : assert(globalInformationApi != null);

  bool isLogged(){
    return globalInformationApi.getGlobalInformation("isLogged");
  }

  dynamic getUserData(String data){
    return globalInformationApi.getGlobalInformation(data);
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

}

class APICredentials {
  String authUrl;
  String authToken;
  String authUserInfo;
  String realmLink;
  String resource;

  Future<void> loadApiCredentials(path) async {
    String jsonString = await rootBundle.loadString(path);
    dynamic data = json.decode(jsonString);
    this.authUrl = data["auth-server-url"];
    this.authToken = data["auth-server-token"];
    this.authUserInfo = data["auth-server-user-info"];
    this.realmLink = data["realm-link"];
    this.resource = data["resource"];

  }
}

