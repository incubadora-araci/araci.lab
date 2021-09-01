import 'package:araci/app/data/provider/talent_api.dart';
import 'package:meta/meta.dart';

class TalentRepository {
  final TalentApiClient talentApiClient;

  TalentRepository({@required this.talentApiClient}) : assert(talentApiClient != null);

  Future getAll() async {
    return await talentApiClient.getAll();
  }

  getFiltered(){

  }

  // getId(id) {
  //   return talentApiClient.getId(id);
  // }

}

