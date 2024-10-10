import 'package:astronacci/module/forgot_password/presentation/binding/forgot_password_binding.dart';
import 'package:astronacci/module/forgot_password/presentation/page/forgot_password_page.dart';
import 'package:astronacci/module/home/presentation/binding/home_binding.dart';
import 'package:astronacci/module/login/presentation/binding/login_binding.dart';
import 'package:astronacci/module/register/presentation/binding/register_binding.dart';
import 'package:astronacci/module/user/presentation/binding/user_binding.dart';
import 'package:astronacci/module/user/presentation/page/user_page.dart';
import 'package:astronacci/module/home/presentation/page/home.dart';
import 'package:astronacci/module/login/presentation/page/login.dart';
import 'package:astronacci/module/register/presentation/page/register_page.dart';
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