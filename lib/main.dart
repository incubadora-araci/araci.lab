import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/app_theme.dart';

void main() async {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Araci",
        initialRoute: Routes.SPLASH, //Rota inicial
        theme: appThemeDataDark, //Tema personalizado app
        defaultTransition: Transition.fade, // Transição de telas padrão
        getPages: AppPages.pages, // Seu array de navegação contendo as rotas e suas pages
        locale: Locale('pt', 'BR'), // Língua padrão
//        translationsKeys: AppTranslation.translations, // Suas chaves contendo as traduções<map>
      )
  );
}