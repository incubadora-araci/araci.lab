import 'package:araci/app/data/provider/api.dart';
import 'package:meta/meta.dart';

class HomeRepository {
  final MyApiClient apiClient;

  HomeRepository({@required this.apiClient}) : assert(apiClient != null);


  getAllVids(){
    return apiClient.getAllVids();
  }
  getAll() {
    return apiClient.getAll();
  }

  getId(id) {
    return apiClient.getId(id);
  }

  delete(id) {
    return apiClient.delete(id);
  }

  edit(obj) {
    return apiClient.edit(obj);
  }

  add(obj) {
    return apiClient.add(obj);
  }
}

