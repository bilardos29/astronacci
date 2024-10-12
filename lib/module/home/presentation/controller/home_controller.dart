import 'package:astronacci/module/home/domain/model/user_model.dart';
import 'package:astronacci/module/home/domain/usecase/get_user.dart';
import 'package:astronacci/utils/api_client/dio/exception.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.getUser,
  });

  final GetUser getUser;

  List<UserModel> listUser = [];
  List<UserModel> listUserSearch = [];

  @override
  void onReady() async {
    super.onReady();

    await getDataUser();
    update();
  }

  Future<void> getDataUser() async {
    try {
      listUser = await getUser.execute(1);
    } on BaseException {
      Get.back();
    } finally {
      update();
    }
  }

  Future<void> searchUser(String search) async {
    if (search.isEmpty) {
      listUserSearch = [];
    } else {
      listUserSearch = listUser.where((e) {
        if (e.fullname!.isNotEmpty) {
          return e.fullname!.toLowerCase().startsWith(search.toLowerCase());
        } else {
          return false;
        }
      }).toList();
    }
    update();
  }
}
