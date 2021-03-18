import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/app_theme.dart';

void main() async {
  await GetStorage.init();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Araci",
        initialRoute: Routes.SPLASH, //Rota inicial
        theme: pickCurrentAppTheme() , //Tema personalizado app
        defaultTransition: Transition.fade, // Transição de telas padrão
        getPages: AppPages.pages, // Seu array de navegação contendo as rotas e suas pages
        locale: Locale('pt', 'BR'), // Língua padrão
//        translationsKeys: AppTranslation.translations, // Suas chaves contendo as traduções<map>
      )
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  }
}