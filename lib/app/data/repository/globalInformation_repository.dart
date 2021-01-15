import 'package:araci/app/data/provider/global_information.dart';
import 'package:meta/meta.dart';

class GlobalInformationRepository {
  final GlobalInformationApi globalInformationApi;

  GlobalInformationRepository({@required this.globalInformationApi}) : assert(globalInformationApi != null);

  dynamic getLoginStatus(){
    return globalInformationApi.getGlobalInformation("isLogged");
  }

  dynamic setUserInformation(String fullName, String email, String iduff, bool isLogged){
    globalInformationApi.setGlobalInformation("fullName", fullName);
    globalInformationApi.setGlobalInformation("email", email);
    globalInformationApi.setGlobalInformation("iduff", iduff);
    globalInformationApi.setGlobalInformation("isLogged", isLogged);
  }

  //TODO: Implement get data
}

