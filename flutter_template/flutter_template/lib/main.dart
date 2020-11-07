import 'package:flutter/material.dart';
import 'package:flutter_template/app/modules/login/login_page.dart';
import 'package:flutter_template/app/routes/app_pages.dart';
import 'package:flutter_template/app/routes/app_routes.dart';
import 'package:flutter_template/app/routes/middleware/middleware_service.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/app/core/store/menu_provider.dart';
import 'package:flutter_template/app/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuProvider(),
        )
      ],
      child: GetMaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'MX'),
        ],
        title: "Flutter template",
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.LOGIN_PAGE,
        //home: LoginPage(),
        theme: themeData(),
        getPages: AppPages.pages,
        routingCallback: routingCallback,
      ),
    );
  }
}
