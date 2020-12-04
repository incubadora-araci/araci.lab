import 'package:get_storage/get_storage.dart';

class GlobalInformationApi {
  final storage = GetStorage();

  GlobalInformationApi();

  Future setGlobalInformation(String key, dynamic value) async {
    try{
      storage.write(key, value);
    }
    catch(e){

    }
  }

  dynamic getGlobalInformation(String key){
    return storage.read(key);
  }
}