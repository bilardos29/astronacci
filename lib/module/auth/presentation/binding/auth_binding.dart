import 'package:astronacci/module/auth/data/datasource/auth_datasource.dart';
import 'package:astronacci/module/auth/data/repository/auth_repository.dart';
import 'package:astronacci/module/auth/domain/interface/auth_interface.dart';
import 'package:astronacci/module/auth/domain/usecase/forgot_password.dart';
import 'package:astronacci/module/auth/domain/usecase/initialize_db.dart';
import 'package:astronacci/module/auth/domain/usecase/login.dart';
import 'package:astronacci/module/auth/domain/usecase/register.dart';
import 'package:astronacci/module/auth/presentation/controller/forgot_password_controller.dart';
import 'package:astronacci/module/auth/presentation/controller/login_controller.dart';
import 'package:astronacci/module/auth/presentation/controller/register_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthDatasourceImpl>(AuthDatasourceImpl());

    Get.put<AuthInterface>(
      AuthRepository(dtSourceImpl: Get.find()),
    );

    //UseCase
    Get.put<Login>(Login(authInterface: Get.find()));

    Get.put<Register>(Register(authInterface: Get.find()));

    Get.put<ForgotPassword>(ForgotPassword(authInterface: Get.find()));

    Get.put<InitializeDB>(InitializeDB(authInterface: Get.find()));


    Get.put(LoginController(login: Get.find(), initializeDB: Get.find()));

    Get.put(RegisterController(register: Get.find()));

    Get.put(ForgotPasswordController(forgotPassword: Get.find()));
  }
}
