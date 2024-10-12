import 'package:astronacci/module/home/data/datasource/home_datasource.dart';
import 'package:astronacci/module/home/data/repository/home_repository.dart';
import 'package:astronacci/module/home/domain/interface/home_interface.dart';
import 'package:astronacci/module/home/domain/usecase/get_user.dart';
import 'package:astronacci/module/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {

    Get.put<HomeDatasourceImpl>(HomeDatasourceImpl());

    Get.put<HomeInterface>(
      HomeRepository(dtSourceImpl: Get.find()),
    );

    //UseCase
    Get.put<GetUser>(GetUser(homeInterface: Get.find()));

    Get.put(HomeController(getUser: Get.find()));
  }
}
