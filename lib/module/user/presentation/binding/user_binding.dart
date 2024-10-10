import 'package:astronacci/module/user/presentation/controller/user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(UserController());
  }

}