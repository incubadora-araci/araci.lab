import 'package:araci/app/data/model/talent_model.dart';
import 'package:araci/app/data/provider/talent_api.dart';
import 'package:araci/app/data/repository/talent_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Node;
import 'package:http/http.dart' as http;


class TalentController extends GetxController {

  TalentRepository talentRepository = TalentRepository(talentApiClient: TalentApiClient(httpClient: http.Client()));
  TalentModel? talents;
  int talentLength = 0;
  TextEditingController searchTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController skillTextController = TextEditingController();
  bool isLoading = true;
  bool error = false;
  Map<String, dynamic> skillMap = {
  'Animação': 1344,
  'Assistência de animação': 1345,
  'Assistência de arte': 1346,
  'Assistência de câmera': 1347,
  'Assistência de cenografia': 1348,
  'Assistência de direção': 1349,
  'Assistência de figurino': 1350,
  'Assistência de montagem': 1351,
  'Assistência de produção': 1352,
  'Assistência de som': 1353,
  'Captação de som': 1354,
  'Cenografia': 1355,
  'Cenotécnica': 1356,
  'Continuidade': 1357,
  'Contrarregra': 1358,
  'Correção de cor': 1359,
  'Direção': 1360,
  'Direção de animação': 1361,
  'Direção de arte': 1362,
  'Direção de fotografia': 1363,
  'Direção de produção': 1364,
  'Edição de som': 1365,
  'Efeitos especiais': 1366,
  'Elétrica': 1367,
  'Figurino': 1368,
  'Iluminação': 1369,
  'Maquinária': 1370,
  'Microfonagem': 1371,
  'Mixagem': 1372,
  'Montagem': 1373,
  'Operação de câmera': 1374,
  'Pesquisa': 1375,
  'Produção de arte': 1376,
  'Produção de elenco': 1377,
  'Produção de Finalização': 1378,
  'Produção de set': 1379,
  'Produção executiva': 1380,
  'Roteiro': 1381,
  'Ruído de sala': 1382,
  'Still': 1383,
  'Storybord': 1384
  };
  // List<String> skillList = [];

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
      if(talents!=null){
        //fillSkillsList(value);
        isLoading = false;
      }
      update();
    });

  }

  fetchFilteredTalentData(String skill){
    isLoading = true;
    update();
    talentRepository.getFiltered(skillMap[skill]).then((value) {
      talents = value;
      talentLength = talents!.nodes!.length;
      if (talents != null){
        isLoading = false;
      }
      update();
    });
  }

  void navigateTo(String page,{dynamic data}){
    Get.toNamed(page,arguments: data);
  }

  // void fillSkillsList(TalentModel talents){
  //   List<String> auxSkillList = [];
  //   List<Nodes> peopleList = talents.nodes!;
  //   //first remove the commas
  //   peopleList.forEach((element) {
  //     auxSkillList.addAll(element.node!.especialidades!.split(','));
  //   });
  //   debugPrint("FIRST AUX LIST: $auxSkillList");
  //   // then remove the  ' e '
  //   auxSkillList.forEach((element) {
  //     skillList.addAll(element.split(' e '));
  //   });
  //   debugPrint("SKILL LIST WITH DUPLICATES: $skillList");
  //   //remove duplicates
  //   skillList = skillList.toSet().toList();
  //   debugPrint("SKILL LIST WITHOUT DUPLICATES: $skillList");
  // }

}