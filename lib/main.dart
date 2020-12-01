import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/splash_bindings.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/app_theme.dart';
//import 'package:getx_pattern/app/routes/app_pages.dart';
//import 'package:getx_pattern/app/translations/app_translations.dart';
//
//import 'app/ui/android/home/home_page.dart';
//import 'app/ui/theme/app_theme.dart';

void main() {
  runApp(
      GetMaterialApp(
        title: "Araci",
//        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH, //Rota inicial
        initialBinding: SplashBinding(), // dependencias iniciais
        theme: appThemeDataDark, //Tema personalizado app
        defaultTransition: Transition.fade, // Transição de telas padrão
        getPages: AppPages.pages, // Seu array de navegação contendo as rotas e suas pages
//        home: HomePage(), // Page inicial
        locale: Locale('pt', 'BR'), // Língua padrão
//        translationsKeys: AppTranslation.translations, // Suas chaves contendo as traduções<map>
      )
  );
}