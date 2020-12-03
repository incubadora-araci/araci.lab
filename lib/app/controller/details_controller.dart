import 'package:araci/app/data/repository/article_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class DetailsController extends GetxController {

  final ArticleRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
}