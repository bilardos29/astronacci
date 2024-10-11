import 'package:astronacci/module/auth/domain/interface/auth_interface.dart';

class ForgotPassword {

  ForgotPassword({
    required this.authInterface,
  });

  final AuthInterface authInterface;

  Future<bool> execute(String email) async {
    return await authInterface.forgotPassword(email);
  }
}