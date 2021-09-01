import 'package:araci/app/data/model/talent_model.dart';
import 'package:araci/app/data/provider/talent_api.dart';
import 'package:araci/app/data/repository/talent_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TalentController extends GetxController {

  TalentRepository talentRepository = TalentRepository(talentApiClient: TalentApiClient(httpClient: http.Client()));
  TalentModel talents;
  int talentLength = 0;

  final _isLoading = true.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  @override
  onInit(){
    fetchTalentData();
    super.onInit();
  }

  fetchTalentData() async {
    // TalentModel talent = await talentRepository.getAll();
    // print("Return from api = ${talent}");
    talentRepository.getAll().then((value) {
      talents = value;
      talentLength = talents.nodes.length;
      print("returned to controller = $value");
      isLoading = false;
      update();
    });

  }
}