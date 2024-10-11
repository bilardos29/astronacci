import 'package:astronacci/module/auth/domain/interface/auth_interface.dart';

class Login {

  Login({
    required this.authInterface,
  });

  final AuthInterface authInterface;

  Future<bool> execute(String email, String password) async {
    return await authInterface.login(email, password);
  }
}