import 'package:astronacci/module/auth/presentation/binding/auth_binding.dart';
import 'package:astronacci/module/auth/presentation/page/forgot_password_page.dart';
import 'package:astronacci/module/auth/presentation/page/login.dart';
import 'package:astronacci/module/auth/presentation/page/register_page.dart';
import 'package:astronacci/module/home/presentation/binding/home_binding.dart';
import 'package:astronacci/module/profile/presentation/binding/profile_binding.dart';
import 'package:astronacci/module/profile/presentation/page/profile_page.dart';
import 'package:astronacci/module/home/presentation/page/home.dart';
import 'package:astronacci/module/unknown/presentation/page/unknown_page.dart';

import 'package:get/get.dart';

class RouteConfig {
  static const login = '/login';
  static const home = '/home';
  static const forgotpassword = '/forgotpassword';
  static const register = '/register';
  static const unknownRoute = '/unknownroute';
  static const profile = '/profile';
  static const detailuser = '/detailuser';

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
      name: profile,
      page: () => ProfilePage(
        controller: Get.find(),
      ),
      binding: ProfileBinding(),
    ),
    // GetPage(
    //   name: detailuser,
    //   page: () => ProfilePage(
    //     controller: Get.find(),
    //   ),
    //   binding: ProfileBinding(),
    // ),
  ];

  static final unknownPage =
      GetPage(name: unknownRoute, page: () => const UnknownPage());
}
