import 'package:astronacci/module/auth/domain/interface/auth_interface.dart';
import 'package:astronacci/module/auth/domain/model/user_model.dart';

class Register {

  Register({
    required this.authInterface,
  });

  final AuthInterface authInterface;

  Future<bool> execute(UserModel user) async {
    return await authInterface.register(user);
  }
}