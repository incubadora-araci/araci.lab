import 'package:araci/app/data/provider/global_information.dart';
import 'package:meta/meta.dart';

class GlobalInformationRepository {
  final GlobalInformationApi globalInformationApi;

  GlobalInformationRepository({@required this.globalInformationApi}) : assert(globalInformationApi != null);

  dynamic getLoginStatus(){
    return globalInformationApi.getGlobalInformation("isLogged");
  }

  //TODO: Implement get data
}

