import 'package:astronacci/module/auth/domain/model/user_model.dart';
import 'package:astronacci/utils/local_database_util.dart';
import 'package:uuid/uuid.dart';

abstract class AuthDatasourceInterface {
  void initializeDB();

  Future<bool> login(String email, String password);

  Future<bool> register(UserModel user);

  Future<bool> forgotPassword(String email);

  Future<bool> insertUser(UserModel user);
}

class AuthDatasourceImpl extends AuthDatasourceInterface {
  @override
  Future<bool> login(String email, String password) async {
    // TODO: implement login
    DBLocalUtil localDB = DBLocalUtil();

    String q = 'Select * from ${DBLocalUtil.user} '
        'where email = \'$email\' '
        'and password = \'$password\' ';
    bool isEmpty = await isUserEmpty(localDB, q);

    return !isEmpty;
  }

  @override
  void initializeDB() async {
    // TODO: implement initializeDB
    DBLocalUtil localDB = DBLocalUtil();
    await localDB.createTable();
  }

  @override
  Future<bool> forgotPassword(String email) async {
    // TODO: implement forgotPassword
    DBLocalUtil localDB = DBLocalUtil();

    String q = 'Select * from ${DBLocalUtil.user} '
        'where email = \'$email\' ';
    bool isEmpty = await isUserEmpty(localDB, q);

    return !isEmpty;
  }

  @override
  Future<bool> register(UserModel user) async {
    // TODO: implement register
    DBLocalUtil localDB = DBLocalUtil();

    String q = 'Select * from ${DBLocalUtil.user} '
        'where email = \'${user.email}\' ';
    bool isEmpty = await isUserEmpty(localDB, q);

    if(isEmpty) {
      user.id = const Uuid().v4();
      int value = await localDB.insertData(DBLocalUtil.user, user.toJson());
      return value != 0;
    }

    return false;
  }

  @override
  Future<bool> insertUser(UserModel user) async {
    // TODO: implement insertUser
    DBLocalUtil localDB = DBLocalUtil();

    String q = 'Select * from ${DBLocalUtil.user} '
        'where email = \'${user.email}\' ';
    bool isEmpty = await isUserEmpty(localDB, q);

    if(isEmpty) {
      user.id = const Uuid().v4();
      int value = await localDB.insertData(DBLocalUtil.user, user.toJson());
      return value != 0;
    }

    return false;
  }

  Future<bool> isUserEmpty(DBLocalUtil localDB, String query) async {
    List<Map<String, Object?>> rawData = await localDB.getCustomQuery(query);
    List<UserModel> listUser =
        List.from(rawData).map((json) => UserModel.fromJson(json)).toList();
    if (listUser.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
