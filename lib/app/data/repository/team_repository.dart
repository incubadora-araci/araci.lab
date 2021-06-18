import 'package:araci/app/data/provider/team_information.dart';

class TeamRepository {

  TeamRepository();

  List getAll() {
    return TeamInformation.team;
  }

  // getByName(String name){
  //   return TeamInformation.team[name];
  // }
}

