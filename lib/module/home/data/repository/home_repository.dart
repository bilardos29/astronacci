import 'package:astronacci/module/home/data/datasource/home_datasource.dart';
import 'package:astronacci/module/home/domain/interface/home_interface.dart';
import 'package:astronacci/module/home/domain/model/user_model.dart';

class HomeRepository implements HomeInterface {

  HomeRepository({
    required this.dtSourceImpl,
  });

  final HomeDatasourceImpl dtSourceImpl;

  @override
  Future<List<UserModel>> getData(int page) async {
    // TODO: implement getData
    return await dtSourceImpl.getUser(page);
  }

}