import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:araci/app/routes/app_pages.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';


class LoginController extends GetxController {

  final GlobalInformationRepository repository;
  LoginController({@required this.repository}) : assert(repository != null);

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
  bool isBusy = false;

  @override
  void onReady() async {
    super.onInit();
    authorize();
  }

  void authorize() async {
    isBusy = true;
    update();
    FlutterAppAuth _appAuth =  Get.find<FlutterAppAuth>();
    try{
      // use the discovery endpoint to find the configuration
      final AuthorizationTokenResponse result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
            "uffmobile",
            "br.uff.uffmobileplus:/",
            scopes: ['openid',"email", "profile"],
            clientSecret:"e6427ae5-32da-472a-a628-f1368e1b6857",
            additionalParameters: {"grant_type": "authorization_code"},
            serviceConfiguration: AuthorizationServiceConfiguration(
              "https://app.uff.br/auth/realms/master/protocol/openid-connect/auth", "https://app.uff.br/auth/realms/master/protocol/openid-connect/token"),
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
        Get.defaultDialog(title: "LOGIN RESULT NULL!!");
      }
    }
    catch(e) {
      print("THE ERROR WAS - > $e");
      isBusy = false;
      update();
    }
  }

  void _processAuthResponse(AuthorizationTokenResponse result) {
    print(
        "authorizationAdditionalParameters: ${result.authorizationAdditionalParameters}");
    print("accessToken: ${result.accessToken}");
    print(
        "accessTokenExpirationDateTime: ${result.accessTokenExpirationDateTime}");
    print("refreshToken: ${result.refreshToken}");
    print("idToken: ${result.idToken}");
    print("tokenType: ${result.tokenType}");
    Get.toNamed(Routes.DETAILS);
  }


}