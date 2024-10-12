import 'package:astronacci/module/auth/domain/model/user_model.dart';
import 'package:astronacci/module/auth/domain/usecase/register.dart';
import 'package:astronacci/utils/validation.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController({
    required this.register,
  });

  final Register register;

  String validateEmail(String email) {
    if (email.isEmpty) return 'Email can\'t empty!';
    if (!ValidationUtil.checkEmail(email)) return 'Email format is wrong';
    return '';
  }

  String validatePassword(String pass, String repass) {
    if (pass.isEmpty) return 'Password can\'t empty!';
    if (repass.isEmpty) return 'Re-Password can\'t empty!';
    if (!ValidationUtil.checkPassword(pass)) return 'Password format is wrong';
    if (pass != repass) return 'Password is not match with Re-Password';
    return '';
  }

  String validateFullname(String fullname) {
    if (fullname.isEmpty) return 'Fullname can\'t empty!';
    return '';
  }

  String validatePhone(String phone) {
    if (phone.isEmpty) return 'Phone number can\'t empty!';
    if (!ValidationUtil.checkPhone(phone)) return 'Phone number format is wrong';
    return '';
  }

  Future<String> validate(
    String email,
    String fullname,
    String phone,
    String pass,
    String repass,
  ) async {

    String errFullname = validateFullname(fullname);
    if (errFullname.isNotEmpty) return errFullname;

    String errEmail = validateEmail(email);
    if (errEmail.isNotEmpty) return errEmail;

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
    return errValidate ? '' : 'Registration Failed!';
  }
}
