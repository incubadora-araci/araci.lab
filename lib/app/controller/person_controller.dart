import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PersonController extends GetxController {

  bool isURLEmpty(String url){
    print("len da url = ${url.length > 0}");
    return !(url.length > 0);
  }
}