import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khabar_news_app/utils/app_routes.dart';
import 'package:khabar_news_app/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khabar News App',
      debugShowCheckedModeBanner: false,
      theme: Themes.appTheme,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
