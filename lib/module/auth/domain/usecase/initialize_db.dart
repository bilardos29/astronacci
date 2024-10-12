import 'package:astronacci/module/auth/domain/interface/auth_interface.dart';
import 'package:astronacci/module/auth/domain/model/user_model.dart';

class InitializeDB {

  InitializeDB({
    required this.authInterface,
  });

  final AuthInterface authInterface;

  void execute() async {
    authInterface.initializeDB();
  }

  void executeInsertDumbData(List<UserModel> listUser) async {
    for(UserModel item in listUser) {
      authInterface.insertUser(item);
    }
  }
}