import 'package:flutter/foundation.dart';

class ApiEndpoint {
  final String _hostApi = '';

  //auth
  String get login => '${_hostApi}rest/ess/login';

  String get logout => '${_hostApi}rest/ess/logout';

  String get register => '${_hostApi}rest/ess/register';

  String get forgotpassword => '${_hostApi}rest/ess/forgotpassword';

  //user
  String get getListUser => '${_hostApi}rest/ess/displayDataKaryawanPersonal';
}
