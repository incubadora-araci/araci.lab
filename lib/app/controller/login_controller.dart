import 'package:araci/app/data/provider/article_api.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController {

  final GlobalInformationRepository repository;
  LoginController({required this.repository}) : assert(repository != null);

  final _isBusy = false.obs;
  set isBusy(value) => _isBusy.value = value;
  get isBusy => _isBusy.value;

  String? url;
  late APICredentials apiCredentials;

  @override
  void onInit() async {
    super.onInit();
    authorize();
  }

  void authorize() async {
    isBusy = true;
    apiCredentials = Get.find<APICredentials>();
    // update();
    print("CLIENT => ${apiCredentials.client}");
    print("SECRET => ${apiCredentials.secretProd}");
    FlutterAppAuth _appAuth =  Get.find<FlutterAppAuth>();
    try{
      // use the discovery endpoint to find the configuration
      final AuthorizationTokenResponse? result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
            apiCredentials.client!,
            "br.uff.araci:/oauthredirect",
            scopes: ['openid'],
            clientSecret:apiCredentials.secretProd,
            additionalParameters: {"grant_type": "authorization_code"},
            serviceConfiguration: AuthorizationServiceConfiguration(
              authorizationEndpoint: 
              "${apiCredentials.authUrl}", tokenEndpoint: "${apiCredentials.authToken}"),
            )
      );

      // or just use the issuer
      // var result = await _appAuth.authorize(
      //   AuthorizationRequest(
      //     _clientId,
      //     _redirectUrl,
      //     issuer: _issuer,
      //     scopes: _scopes,
      //   ),
      // );
      if (result != null) {
        _processAuthResponse(result);
      }
      else{
        Get.defaultDialog(title: "Não foi possível logar, tente mais tarde");
      }
    }
    catch(e) {
      Get.defaultDialog(title: "Login Cancelado",middleText: "",textConfirm: "OK!",onConfirm: ()=>Get.back(closeOverlays: true));
      print("THE ERROR WAS - > $e");
      isBusy = false;
    }
  }

  Future<void> _processAuthResponse(AuthorizationTokenResponse result) async {
    // print(
    //     "authorizationAdditionalParameters: ${result.authorizationAdditionalParameters}");
    // print("accessToken: ${result.accessToken}");
    // print(
    //     "accessTokenExpirationDateTime: ${result.accessTokenExpirationDateTime}");
    // print("refreshToken: ${result.refreshToken}");
    // print("idToken: ${result.idToken}");
    // print("tokenType: ${result.tokenType}");
    final decodedIdToken = Jwt.parseJwt(result.idToken!);
    final String fullName = decodedIdToken["name"];
    bool isAdm = await Get.put(MyApiClient(httpClient: http.Client())).admChecking(fullName);
    repository.setUserInformation(fullName, "none", "none", true, isAdm);

    Get.toNamed(Routes.DETAILS);
  }

}