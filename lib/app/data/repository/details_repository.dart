import 'package:araci/app/data/provider/api.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:meta/meta.dart';

class DetailsRepository {
  final DatabaseApi apiClient;

  DetailsRepository({@required this.apiClient}) : assert(apiClient != null);

}

