import 'package:araci/app/bindings/details_bindings.dart';
import 'package:araci/app/ui/details/details_page.dart';
import 'package:araci/app/ui/home/home_page.dart';
import 'package:araci/app/ui/reusable_widgets/webview.dart';
import 'package:araci/app/ui/splash/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

/// How to use: GetPage(name: page name from app_routes.dart,  page ()=> Page instance,  binding:  Binding instance of the page)
abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.SPLASH, page: ()=> SplashPage()),
    GetPage(name: Routes.LOGIN, page:()=> null),
    GetPage(name: Routes.HOME, page:()=> HomePage()),
    GetPage(name: Routes.DETAILS, page: ()=> DetailsPage(), binding: DetailsBinding()),
    GetPage(name: Routes.WEBVIEW, page:()=> WebviewPage()),
  ];
}