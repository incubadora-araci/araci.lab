import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PersonController extends GetxController {

  bool isURLEmpty(String url){
    return !(url.length > 0);
  }

  List<String> processLinks(String rawLinks){
    if (rawLinks.isNotEmpty)return rawLinks.split(',');
    return [rawLinks];
  }
}