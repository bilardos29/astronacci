import 'package:astronacci/module/auth/domain/usecase/forgot_password.dart';
import 'package:astronacci/utils/validation.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

  ForgotPasswordController({
    required this.forgotPassword,
  });

  final ForgotPassword forgotPassword;

  String validateEmail(String email) {
    if (email.isEmpty) return 'Email cann\'t empty!';
    if (!ValidationUtil.checkEmail(email)) return 'Email format is wrong';
    return '';
  }

  Future<String> validate(String email) async {
    String errEmail = validateEmail(email);
    if(errEmail.isNotEmpty) return errEmail;

    bool errValidate = await forgotPassword.execute(email);
    return errValidate ? '' : 'Error Forgot Password';
  }

}