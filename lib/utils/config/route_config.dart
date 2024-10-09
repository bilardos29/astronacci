import 'package:astronacci/module/home/presentation/binding/home_binding.dart';
import 'package:astronacci/module/login/presentation/binding/login_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../module/home/presentation/page/home.dart';
import '../../module/login/presentation/page/login.dart';
import '../../module/unknown/presentation/page/unknown_page.dart';

class RouteConfig {

  static const login = '/login';
  static const home = '/home';
  static const unknownRoute = '/home';

  final listPages = [
    GetPage(
      name: home,
      page: () => HomePage(
        controller: Get.find(),
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(
        controller: Get.find(),
      ),
      binding: LoginBinding(),
    ),
  ];

  static final unknownPage =
  GetPage(name: unknownRoute, page: () => const UnknownPage());
}