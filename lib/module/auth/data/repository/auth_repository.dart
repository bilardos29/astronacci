import 'package:astronacci/module/auth/data/datasource/auth_datasource.dart';
import 'package:astronacci/module/auth/domain/interface/auth_interface.dart';
import 'package:astronacci/module/auth/domain/model/user_model.dart';

class AuthRepository implements AuthInterface {

  AuthRepository({
    required this.dtSourceImpl,
  });

  final AuthDatasourceImpl dtSourceImpl;

  @override
  Future<bool> forgotPassword(String email) async {
    // TODO: implement forgotPassword
    return await dtSourceImpl.forgotPassword(email);
  }

  @override
  void initializeDB() {
    // TODO: implement initializeDB
    dtSourceImpl.initializeDB();
  }

  @override
  Future<bool> login(String email, String password) async {
    // TODO: implement login
    return await dtSourceImpl.login(email, password);
  }

  @override
  Future<bool> register(UserModel user) async {
    // TODO: implement register
    return await dtSourceImpl.register(user);
  }

}