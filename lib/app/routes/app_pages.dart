import 'package:araci/app/bindings/details_bindings.dart';
import 'package:araci/app/bindings/login_bindings.dart';
import 'package:araci/app/bindings/settings_bindings.dart';
import 'package:araci/app/bindings/splash_bindings.dart';
import 'package:araci/app/ui/about/about_page.dart';
import 'package:araci/app/ui/details/details_page.dart';
import 'package:araci/app/ui/intro/intro_page.dart';
import 'package:araci/app/ui/login/login_page.dart';
import 'package:araci/app/ui/settings/settings_page.dart';
import 'package:araci/app/ui/splash/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

/// How to use: GetPage(name: page name from app_routes.dart,  page ()=> Page instance,  binding:  Binding instance of the page)
abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.SPLASH, page: ()=> SplashPage(), binding: SplashBinding()),
    GetPage(name: Routes.LOGIN, page:()=> LoginPage(), binding: LoginBinding()),
    // GetPage(name: Routes.HOME, page:()=> HomePage()),
    GetPage(name: Routes.DETAILS, page: ()=> DetailsPage(), binding: DetailsBinding()),
    GetPage(name: Routes.ABOUT, page:()=> AboutPage()),
    GetPage(name: Routes.INTRO, page:()=> IntroPage()),
    GetPage(name: Routes.SETTINGS, page:()=> SettingsPage(),binding: SettingsBindings()),
  ];
}