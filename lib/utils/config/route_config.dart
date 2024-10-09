import 'package:astronacci/module/forgot_password/presentation/binding/forgot_password_binding.dart';
import 'package:astronacci/module/forgot_password/presentation/page/forgot_password_page.dart';
import 'package:astronacci/module/home/presentation/binding/home_binding.dart';
import 'package:astronacci/module/login/presentation/binding/login_binding.dart';
import 'package:astronacci/module/register/presentation/binding/register_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../module/home/presentation/page/home.dart';
import '../../module/login/presentation/page/login.dart';
import '../../module/register/presentation/page/register_page.dart';
import '../../module/unknown/presentation/page/unknown_page.dart';

class RouteConfig {

  static const login = '/login';
  static const home = '/home';
  static const forgotpassword = '/forgotpassword';
  static const register = '/register';
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
    GetPage(
      name: forgotpassword,
      page: () => ForgotPasswordPage(
        controller: Get.find(),
      ),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: register,
      page: () => RegisterPage(
        controller: Get.find(),
      ),
      binding: RegisterBinding(),
    ),
  ];

  static final unknownPage =
  GetPage(name: unknownRoute, page: () => const UnknownPage());
}