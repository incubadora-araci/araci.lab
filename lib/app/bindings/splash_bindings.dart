import 'package:araci/app/controller/splash_controller.dart';
import 'package:araci/app/data/provider/databaseApi.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/globalInformation_repository.dart';
import 'package:get/get.dart';



class SplashBinding implements Bindings {
  @override
  void dependencies() async {

    // await Get.putAsync<DatabaseApi>(() async {
    //   return await DatabaseApi().init();
    // });

    Get.put( await DatabaseApi().init(), permanent: true);

    Get.putAsync<APICredentials>(() async {
      APICredentials apiCredentials = APICredentials();
      await apiCredentials.loadApiCredentials("assets/uffapi.json");
      return apiCredentials;
    }, permanent: true);


    Get.put<SplashController>(
        SplashController(
            repository: GlobalInformationRepository(globalInformationApi: GlobalInformationApi())
        )
    );

  }
}