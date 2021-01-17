import 'dart:convert';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:crypto/crypto.dart';



class LoginController extends GetxController {

  final GlobalInformationRepository repository;
  LoginController({@required this.repository}) : assert(repository != null);

  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
  bool isBusy = false;
  String url;
  APICredentials apiCredentials;

  final flutterWebViewPlugin = new FlutterWebviewPlugin();
  Map<String, List<String>> _loginValues;

  @override
  void onInit() {
    apiCredentials = Get.find<APICredentials>();
    url = "${apiCredentials.authUrl}?"
        "client_id=uffmobile&"
        "response_type=code&"
        "redirect_uri=http://localhost:4000&"
        "scope=openid";

    flutterWebViewPlugin.onUrlChanged.listen((String url){
        Uri _currentUrl = Uri.parse(url);
        // This function will be called several times, but we are interested in
        // the one that gives us the tokens,
        // the session_state will tell the right one.
        if(_currentUrl.queryParameters.containsKey("session_state")){
          _loginValues = _currentUrl.queryParametersAll;
//          debugPrint("Login successful: $_loginValues");
          dispose();
          _finishLogin();
        }

    });
    super.onInit();
  }

  void _finishLogin() {}

  String _assemblePhotoUrl(){
    var bytes = utf8.encode(repository.getUserData("iduff")); // data being hashed
    return repository.getUrl("photos_url")+sha1.convert(bytes).toString()+".jpg";
  }
  @override
  void dispose() {
    // disable the url listener
    flutterWebViewPlugin.close();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  // @override
  // void onReady() async {
  //   super.onInit();
  //   //authorize();
  // }

  // void authorize() async {
  //   isBusy = true;
  //   update();
  //   FlutterAppAuth _appAuth =  Get.find<FlutterAppAuth>();
  //   try{
  //     // use the discovery endpoint to find the configuration
  //     final AuthorizationTokenResponse result = await _appAuth.authorizeAndExchangeCode(
  //       AuthorizationTokenRequest(
  //           "uffmobile",
  //           "br.uff.araci:/",
  //           scopes: ['openid'],
  //           clientSecret:"e6427ae5-32da-472a-a628-f1368e1b6857",
  //           additionalParameters: {"grant_type": "authorization_code"},
  //           serviceConfiguration: AuthorizationServiceConfiguration(
  //             "https://app.uff.br/auth/realms/master/protocol/openid-connect/auth", "https://app.uff.br/auth/realms/master/protocol/openid-connect/token"),
  //           )
  //     );
  //
  //     // or just use the issuer
  //     // var result = await _appAuth.authorize(
  //     //   AuthorizationRequest(
  //     //     _clientId,
  //     //     _redirectUrl,
  //     //     issuer: _issuer,
  //     //     scopes: _scopes,
  //     //   ),
  //     // );
  //     if (result != null) {
  //       _processAuthResponse(result);
  //     }
  //     else{
  //       Get.defaultDialog(title: "LOGIN RESULT NULL!!");
  //     }
  //   }
  //   catch(e) {
  //     print("THE ERROR WAS - > $e");
  //     isBusy = false;
  //     update();
  //   }
  // }
  //
  // void _processAuthResponse(AuthorizationTokenResponse result) {
  //   print(
  //       "authorizationAdditionalParameters: ${result.authorizationAdditionalParameters}");
  //   print("accessToken: ${result.accessToken}");
  //   print(
  //       "accessTokenExpirationDateTime: ${result.accessTokenExpirationDateTime}");
  //   print("refreshToken: ${result.refreshToken}");
  //   print("idToken: ${result.idToken}");
  //   print("tokenType: ${result.tokenType}");
  //   Get.toNamed(Routes.DETAILS);
  // }


}