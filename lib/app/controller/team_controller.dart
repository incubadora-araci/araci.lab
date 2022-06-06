import 'package:araci/app/data/repository/team_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class TeamController extends GetxController {
  TeamRepository _teamRepository = TeamRepository();
  int teamLength = 0;

  TeamController();
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
  @override
  void onInit() {
    teamLength = _teamRepository.getAll().length;
    super.onInit();
  }

  List<Map<String, dynamic>> getAllMembers(){
    return _teamRepository.getAll() as List<Map<String, dynamic>>;
  }

}
