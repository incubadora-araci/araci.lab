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
    });

    Get.put<SplashController>(
        SplashController(
            repository: GlobalInformationRepository(globalInformationApi: GlobalInformationApi())
        )
    );
    // Get.put<SizeConfig>(SizeConfig());

    // GetStorage().write("isLogged", false);

    // Get.putAsync<GetStorage>(() async {
    //   print("inicializando get storage");
    //
    //   final storage = GetStorage();
    //   storage.write("isLogged", false);
    //   print("Done initializing getstorage");
    //   return storage;
    // },
    //   permanent: true
    // );


    // Get.put<HomeController>(
    //     HomeController(
    //         repository: ArticleRepository(databaseApi: DatabaseApi()))
    // );

    // Get.putAsync<DetailsController>(() async{
    //   DatabaseApi databaseApi = DatabaseApi();
    //   await databaseApi.init();
    //   return DetailsController(repository: ArticleRepository( databaseApi: databaseApi));
    // });

    // Get.put<DetailsController>(
    //   DetailsController(repository: ArticleRepository( databaseApi: DatabaseApi())),
    // );

    // Get.lazyPut<HomeController>(() {
    //   return HomeController(
    //       repository:
    //       HomeRepository(apiClient: MyApiClient(httpClient: http.Client())));
    // });
  }
}