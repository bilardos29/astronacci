import 'package:astronacci/module/auth/domain/model/user_model.dart';
import 'package:astronacci/module/auth/domain/usecase/initialize_db.dart';
import 'package:astronacci/module/auth/domain/usecase/login.dart';
import 'package:astronacci/utils/validation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController({
    required this.login,
    required this.initializeDB,
  });

  final Login login;
  final InitializeDB initializeDB;

  String validateEmail(String email) {
    if (email.isEmpty) return 'Email can\'t empty!';
    if (!ValidationUtil.checkEmail(email)) return 'Email format is wrong';
    return '';
  }

  String validatePassword(String pass) {
    if (pass.isEmpty) return 'Password can\'t empty!';
    if (!ValidationUtil.checkPassword(pass)) return 'Password format is wrong';
    return '';
  }

  Future<String> validate(String email, String pass) async {
    String errEmail = validateEmail(email);
    if (errEmail.isNotEmpty) return errEmail;

    String errPass = validatePassword(pass);
    if (errPass.isNotEmpty) return errPass;

    bool errValidate = await login.execute(email, pass);

    return errValidate ? '' : 'User not found!';
  }

  void init() {
    initializeDB.execute();
    initializeDB.executeInsertDumbData(dumbData());
  }

  List<UserModel> dumbData() {
    List<UserModel> listUser = [
      UserModel(
          email: 'salah@liverpool.com',
          fullname: 'Mohammad Salah',
          phone: '0811990011122',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'martial@united.com',
          fullname: 'Martial',
          phone: '0811990011133',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'harry.kane@munchen.com',
          fullname: 'Harry Kane',
          phone: '081199003344',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'tom.haye@gmail.com',
          fullname: 'Tom Haye',
          phone: '08119912144',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'gabriel@city.com',
          fullname: 'Gabriel Jesus',
          phone: '081199113121',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'van.dijk@liverpool.com',
          fullname: 'Van Dijk',
          phone: '08111124242',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'anthony@united.com',
          fullname: 'Anthony El Gasing',
          phone: '082231311443',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'joe.cole@chelsea.com',
          fullname: 'Joe Cole',
          phone: '083241410091',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'luis.diaz@liverpool.com',
          fullname: 'Luis Diaz',
          phone: '082131415100',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'nunez@liverpool.com',
          fullname: 'Darwin Nunez',
          phone: '081231410088',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'foden@city.com',
          fullname: 'Phil Foden',
          phone: '081122331122',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'bernando.silva@city.com',
          fullname: 'Bernando Silva',
          phone: '082141009090',
          password: '',
          profilePicture: ''),
      UserModel(
          email: 'kyle.walker@city.com',
          fullname: 'Kyle Walker',
          phone: '082141008181',
          password: '',
          profilePicture: ''),
    ];

    return listUser;
  }
}
