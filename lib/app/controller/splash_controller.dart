import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/splash_repository.dart';
import 'package:araci/app/data/repository/video_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  final SplashRepository repository;
  SplashController({@required this.repository}) : assert(repository != null);
  final _isLogged = false.obs;
  set isLogged(value) => _isLogged.value = value;
  get isLogged => _isLogged.value;

  getLoginStatus(){
    repository.getLoginStatus().then((data) {this.isLogged = data;});
  }


}