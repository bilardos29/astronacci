import 'package:astronacci/module/auth/presentation/binding/auth_binding.dart';
import 'package:astronacci/module/auth/presentation/page/forgot_password_page.dart';
import 'package:astronacci/module/auth/presentation/page/login.dart';
import 'package:astronacci/module/auth/presentation/page/register_page.dart';
import 'package:astronacci/module/home/presentation/binding/home_binding.dart';
import 'package:astronacci/module/user/presentation/binding/user_binding.dart';
import 'package:astronacci/module/user/presentation/page/user_page.dart';
import 'package:astronacci/module/home/presentation/page/home.dart';
import 'package:astronacci/module/unknown/presentation/page/unknown_page.dart';

import 'package:get/get.dart';

class RouteConfig {

  static const login = '/login';
  static const home = '/home';
  static const forgotpassword = '/forgotpassword';
  static const register = '/register';
  static const unknownRoute = '/unknownroute';
  static const user = '/user';

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
      binding: AuthBinding(),
    ),
    GetPage(
      name: forgotpassword,
      page: () => ForgotPasswordPage(
        controller: Get.find(),
      ),
      binding: AuthBinding(),
    ),
    GetPage(
      name: register,
      page: () => RegisterPage(
        controller: Get.find(),
      ),
      binding: AuthBinding(),
    ),
    GetPage(
      name: user,
      page: () => UserPage(
        controller: Get.find(),
      ),
      binding: UserBinding(),
    ),
  ];

  static final unknownPage =
  GetPage(name: unknownRoute, page: () => const UnknownPage());
}