import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';


class LoginController extends GetxController {

  final GlobalInformationRepository repository;
  LoginController({@required this.repository}) : assert(repository != null);

  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
  final _isBusy = false.obs;
  set isBusy(value) => _isBusy.value = value;
  get isBusy => _isBusy.value;

  // bool isBusy = false;
  String url;
  APICredentials apiCredentials;

  // final flutterWebViewPlugin = new FlutterWebviewPlugin();
  // Map<String, List<String>> _loginValues;

//   @override
//   void onInit() {
//     apiCredentials = Get.find<APICredentials>();
//     url = "${apiCredentials.authUrl}?"
//         "client_id=uffmobile&"
//         "response_type=code&"
//         "redirect_uri=http://localhost:4000&"
//         "scope=openid";
//
//     flutterWebViewPlugin.onUrlChanged.listen((String url){
//         Uri _currentUrl = Uri.parse(url);
//         // This function will be called several times, but we are interested in
//         // the one that gives us the tokens,
//         // the session_state will tell the right one.
//         if(_currentUrl.queryParameters.containsKey("session_state")){
//           _loginValues = _currentUrl.queryParametersAll;
// //          debugPrint("Login successful: $_loginValues");
//           dispose();
//           _finishLogin();
//         }
//
//     });
//     super.onInit();
//   }

  // void _finishLogin() async {
  //   var url = apiCredentials.authToken;
  //   String accessToken;
  //
  //   // Get access-token first
  //   await http.post(url, body: {
  //     "client_id": "uffmobile",
  //     "client_secret": apiCredentials.secret,
  //     "code": _loginValues["code"][0],
  //     "grant_type": "authorization_code",
  //     "scope": "openid",
  //     "redirect_uri": "http://localhost:4000"
  //   }).then((response) {
  //     if(response.statusCode == 200) accessToken = json.decode(response.body)["access_token"];
  //     else Navigator.of(context).pop(false);
  //   });
  //
  //   url = DataLoader.instance.apiCredentials.authAuthenticate;
  //   // Get user info using the given access_token
  //   await http.post(url,
  //       headers: {HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"},
  //       body: {
  //         "client_id": "uffmobile",
  //         "client_secret": DataLoader.instance.apiCredentials.credentials["secret"],
  //         "token": accessToken.toString()
  //       }).then((response) async {
  //     // If the server responds of an OK, we can log in the user
  //     // and close this page.
  //     if(response.statusCode == 200){
  //       var userData = json.decode(response.body);
  //       debugPrint(userData.toString());
  //       SharedUser.instance.uid = userData["preferred_username"];
  //       SharedUser.instance.fullName = userData["name"] != null ? userData["name"] : "None";
  //       // Sometimes the response returns without the users email.
  //       SharedUser.instance.email = userData["email"] != null ? userData["email"] : "None";
  //       SharedUser.instance.token = userData["jti"];
  //       SharedUser.instance.photoUrl = _assemblePhotoUrl();
  //       SharedUser.instance.registration = "None";
  //       await SharedUser.instance.login();
  //       Navigator.of(context).pop(true);
  //     }else{
  //       Navigator.of(context).pop(false);
  //     }
  //   });
  //
  // }
  //
  // String _assemblePhotoUrl(){
  //   var bytes = utf8.encode(repository.getUserData("iduff")); // data being hashed
  //   return repository.getUrl("photos_url")+sha1.convert(bytes).toString()+".jpg";
  // }
  // @override
  // void dispose() {
  //   // disable the url listener
  //   flutterWebViewPlugin.close();
  //   flutterWebViewPlugin.dispose();
  //   super.dispose();
  // }

  handleLoginError(){

  }

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
    print("SECRET => ${apiCredentials.secret}");
    FlutterAppAuth _appAuth =  Get.find<FlutterAppAuth>();
    try{
      // use the discovery endpoint to find the configuration
      final AuthorizationTokenResponse result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
            apiCredentials.client,
            "br.uff.araci:/oauthredirect",
            scopes: ['openid'],
            clientSecret:apiCredentials.secret,
            additionalParameters: {"grant_type": "authorization_code"},
            serviceConfiguration: AuthorizationServiceConfiguration(
              "https://app.homologacao.uff.br/auth/realms/master/protocol/openid-connect/auth", "https://app.homologacao.uff.br/auth/realms/master/protocol/openid-connect/token"),
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
      print("THE ERROR WAS - > $e");
      isBusy = false;
      // update();
    }
  }

  void _processAuthResponse(AuthorizationTokenResponse result) {
    // print(
    //     "authorizationAdditionalParameters: ${result.authorizationAdditionalParameters}");
    // print("accessToken: ${result.accessToken}");
    // print(
    //     "accessTokenExpirationDateTime: ${result.accessTokenExpirationDateTime}");
    // print("refreshToken: ${result.refreshToken}");
    // print("idToken: ${result.idToken}");
    // print("tokenType: ${result.tokenType}");
    repository.setUserInformation("Test User", "testUser@id.uff.br", "12345678910", true);
    Get.toNamed(Routes.DETAILS);
  }


}