import 'package:astronacci/module/home/domain/interface/home_interface.dart';
import 'package:astronacci/module/home/domain/model/user_model.dart';

class GetUser {

  GetUser({
    required this.homeInterface,
  });

  final HomeInterface homeInterface;

  Future<List<UserModel>> execute(int page) async {
    return await homeInterface.getData(page);
  }
}