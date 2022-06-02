import 'package:araci/app/data/model/talent_model.dart';
import 'package:araci/app/data/provider/talent_api.dart';
import 'package:araci/app/data/repository/talent_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TalentController extends GetxController {

  TalentRepository talentRepository = TalentRepository(talentApiClient: TalentApiClient(httpClient: http.Client()));
  TalentModel? talents;
  int talentLength = 0;
  TextEditingController searchTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController skillTextController = TextEditingController();
  bool isLoading = true;
  bool shouldFetchData = true;
  Map<int, String> skillMap = {0:"Roteiro", 1:"Edição de vídeo", 2:"Edição de som", 3:"Produção"};

  // get isLoading => _isLoading.value;
  // set isLoading(value) => _isLoading.value = value;

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
      talentLength = talents!.nodes!.length;
      // print("returned to controller = $value");
      if(talents!=null)isLoading = false;
      update();
    });

  }

  fetchFilteredTalentData({String? name, String? bio, String? dept, String? email, String? bond, String? expertise}){
    if(nameTextController.text.isNotEmpty)debugPrint("crazy as hell");
    debugPrint("Nome: ${nameTextController.text}");
    debugPrint("Especialidade: ${skillTextController.text}");
    isLoading = true;
    update();
    talentRepository.getFiltered(name: nameTextController.text??"",bio: bio,dept: dept,email: email,bond: bond,expertise: skillTextController.text??"").then((value) {
      talents = value;
      talentLength = talents!.nodes!.length;
      // print("returned to controller = $value");
      isLoading = false;
      update();
    });
  }

  void navigateTo(String page,{dynamic data}){
    Get.toNamed(page,arguments: data);
  }

  // void changeFetchState() {
  //   shouldFetchData = !shouldFetchData;
  // }

  // onTapFilter() {
  //   fetchFilteredTalentData();
  //   update();
  // }


}