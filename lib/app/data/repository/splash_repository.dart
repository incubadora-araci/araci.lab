import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:meta/meta.dart';

class SplashRepository {
  final GlobalApiClient globalApiClient;

  SplashRepository({@required this.globalApiClient}) : assert(globalApiClient != null);

  getLoginStatus(){
    return globalApiClient.getLoginStatus();
  }
  // getAll() {
  //   return apiClient.getAll();
  // }
  //
  // getId(id) {
  //   return apiClient.getId(id);
  // }
  //
  // delete(id) {
  //   return apiClient.delete(id);
  // }
  //
  // edit(obj) {
  //   return apiClient.edit(obj);
  // }
  //
  // add(obj) {
  //   return apiClient.add(obj);
  // }
}

