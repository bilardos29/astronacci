import 'dart:core';

import 'package:astronacci/module/auth/domain/model/user_model.dart';

abstract class AuthInterface {

  Future<bool> login(String email, String password);

  Future<bool> register(UserModel user);

  Future<bool> forgotPassword(String email);

  void initializeDB();

  Future<bool> insertUser(UserModel user);
}