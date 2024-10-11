import 'package:astronacci/module/auth/domain/model/user_model.dart';
import 'package:astronacci/module/auth/domain/usecase/register.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController({
    required this.register,
  });

  final Register register;

  String validateEmail(String email) {
    return '';
  }

  String validatePassword(String pass, String repass) {
    return '';
  }

  String validateFullname(String fullname) {
    return '';
  }

  String validatePhone(String phone) {
    return '';
  }

  Future<String> validate(
    String email,
    String fullname,
    String phone,
    String pass,
    String repass,
  ) async {
    String errEmail = validateEmail(email);
    if (errEmail.isNotEmpty) return errEmail;

    String errFullname = validateFullname(fullname);
    if (errFullname.isNotEmpty) return errFullname;

    String errPhone = validatePhone(phone);
    if (errPhone.isNotEmpty) return errPhone;

    String errPass = validatePassword(pass, repass);
    if (errPass.isNotEmpty) return errPass;

    UserModel user = UserModel(
      email: email,
      fullname: fullname,
      phone: phone,
      password: pass,
      profilePicture: '',
    );
    bool errValidate = await register.execute(user);
    return errValidate ? '' : 'Error Register';
  }
}
