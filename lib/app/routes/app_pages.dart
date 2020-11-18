import 'package:araci/app/bindings/home_bindings.dart';
import 'package:araci/app/bindings/splash_bindings.dart';
import 'package:araci/app/ui/home/home_page.dart';
import 'package:araci/app/ui/splash/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.SPLASH, page: ()=> SplashPage()),
    GetPage(name: Routes.LOGIN, page:()=> null),
    GetPage(name: Routes.HOME, page:()=> HomePage(), binding: HomeBinding()),
  ];
}