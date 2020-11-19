import 'package:araci/app/controller/splash_controller.dart';
import 'package:araci/app/data/provider/global_information.dart';
import 'package:araci/app/data/repository/splash_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(
          repository: SplashRepository(globalApiClient: GlobalInformationApi()))
    );

    Get.putAsync<GetStorage>(() async {
      await GetStorage.init();
      final storage = GetStorage();
      storage.write("isLogged", true);
      return storage;
    },
      permanent: true
    );
  }
}