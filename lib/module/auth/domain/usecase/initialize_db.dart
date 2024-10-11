import 'package:astronacci/module/auth/domain/interface/auth_interface.dart';

class InitializeDB {

  InitializeDB({
    required this.authInterface,
  });

  final AuthInterface authInterface;

  void execute() async {
    authInterface.initializeDB();
  }
}