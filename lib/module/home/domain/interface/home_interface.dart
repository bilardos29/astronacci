import 'package:astronacci/module/home/domain/model/user_model.dart';

abstract class HomeInterface {

  Future<List<UserModel>> getData(int page);

}