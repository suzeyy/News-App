import 'package:get/get.dart';
import 'package:khabar_news_app/constants/route_constants.dart';
import 'package:khabar_news_app/views/news_detail_screen.dart';
import 'package:khabar_news_app/views/news_list_screen.dart';
import 'package:khabar_news_app/views/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const initial = RouteConstants.splash;
  static final routes = [
    GetPage(
        name: RouteConstants.splash,
        page: () => const SplashScreen(),
        transition: Transition.zoom),
    GetPage(
        name: RouteConstants.newsList,
        page: () => NewsListScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: RouteConstants.newsDetail,
        page: () => NewsDetailScreen(),
        transition: Transition.fadeIn),
  ];
}
