import 'package:get_storage/get_storage.dart';

class GlobalInformationApi {
  final storage = GetStorage();

  GlobalInformationApi();

  Future setGlobalInformation(String key, dynamic value) async {
    try{
      storage.write(key, value);
    }
    catch(e){
      print("Error on setting global Information $e");
    }
  }

  dynamic getGlobalInformation(String key){
    print("information saved $key = ${storage.read(key)}");
    return storage.read(key)??false;
  }

  getUrl(String name){
    switch(name){
      case "photo_url":{
        return "https://sistemas.uff.br/static/identificacoes/oficial/";
      }
      break;
      default: {
        return "";
      }
    }

  }

  eraseUserInformation() async {
    await storage.erase();
  }
}