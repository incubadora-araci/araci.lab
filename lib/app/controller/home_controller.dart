import 'package:araci/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {

  final HomeRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);


  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  getAllVids(){
    return repository.getAllVids();
  }


}