import 'package:astronacci/module/auth/domain/usecase/login.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  LoginController({
    required this.login,
  });

  final Login login;

  String validateEmail(String email){
    return '';
  }

  String validatePassword(String pass){
    return '';
  }

  Future<String> validate(String email, String pass) async {
    String errEmail = validateEmail(email);
    if(errEmail.isNotEmpty) return errEmail;

    String errPass = validatePassword(pass);
    if(errPass.isNotEmpty) return errPass;

    bool errValidate = await login.execute(email, pass);

    return errValidate ? '' : 'Error Login';
  }

}