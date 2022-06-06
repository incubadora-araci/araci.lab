import 'package:araci/app/data/provider/talent_api.dart';
import 'package:meta/meta.dart';

class TalentRepository {
  final TalentApiClient talentApiClient;

  TalentRepository({required this.talentApiClient}) : assert(talentApiClient != null);

  Future getAll() async {
    return await talentApiClient.getAll();
  }

  getFiltered({String? name, String? bio, String? dept, String? email, String? bond, String? expertise}) async{
    return await talentApiClient.getFiltered(name: name,bio: bio,dept: dept,email: email,bond: bond,expertise: expertise);
  }

  // getId(id) {
  //   return talentApiClient.getId(id);
  // }

}

