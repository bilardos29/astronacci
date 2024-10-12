import 'package:astronacci/module/home/domain/model/user_model.dart';
import 'package:astronacci/utils/local_database_util.dart';

abstract class HomeDatasourceInterface {
  Future<List<UserModel>> getUser(int page);
}

class HomeDatasourceImpl extends HomeDatasourceInterface {
  @override
  Future<List<UserModel>> getUser(int page) async {
    // TODO: implement getUser
    DBLocalUtil localDB = DBLocalUtil();

    List<Map<String, Object?>> rawData =
        await localDB.getDataWithPagination(DBLocalUtil.user, null, 10, 1, null);

    List<UserModel> listUser =
        List.from(rawData).map((json) => UserModel.fromJson(json)).toList();
    return listUser;
  }
}
