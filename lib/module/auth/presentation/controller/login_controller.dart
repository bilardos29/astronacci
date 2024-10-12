import 'package:astronacci/module/auth/domain/usecase/initialize_db.dart';
import 'package:astronacci/module/auth/domain/usecase/login.dart';
import 'package:astronacci/utils/validation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController({
    required this.login,
    required this.initializeDB,
  });

  final Login login;
  final InitializeDB initializeDB;

  String validateEmail(String email) {
    if (email.isEmpty) return 'Email can\'t empty!';
    if (!ValidationUtil.checkEmail(email)) return 'Email format is wrong';
    return '';
  }

  String validatePassword(String pass) {
    if (pass.isEmpty) return 'Password can\'t empty!';
    if (!ValidationUtil.checkPassword(pass)) return 'Password format is wrong';
    return '';
  }

  Future<String> validate(String email, String pass) async {
    String errEmail = validateEmail(email);
    if (errEmail.isNotEmpty) return errEmail;

    String errPass = validatePassword(pass);
    if (errPass.isNotEmpty) return errPass;

    bool errValidate = await login.execute(email, pass);

    return errValidate ? '' : 'User not found!';
  }

  void init() {
    initializeDB.execute();
  }
}
