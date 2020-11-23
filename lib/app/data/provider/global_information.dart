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
  //
  // Future add(obj) async {
  //   try {
  //     final response = await httpClient.post(baseUrl,
  //         headers: _defaultHeaders, body: jsonEncode(obj));
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -add');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
  //
  // Future edit(obj) async {
  //   try {
  //     final response = await httpClient.put(baseUrl,
  //         headers: _defaultHeaders, body: jsonEncode(obj));
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -edit');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
  //
  // Future delete(obj) async {
  //   try {
  //     final response = await httpClient.delete(baseUrl);
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -delete');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
}