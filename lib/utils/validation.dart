class ValidationUtil {
  static bool checkEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool checkPassword(String pass) {
    /**
     * r'^
        (?=.*[A-Z])       // should contain at least one upper case
        (?=.*[a-z])       // should contain at least one lower case
        (?=.*?[0-9])      // should contain at least one digit
        (?=.*?[!@#\$&*~]) // should contain at least one Special character
        .{8,}             // Must be at least 8 characters in length
        $
     * */
    final bool passwordValid =
        RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
            .hasMatch(pass);
    return passwordValid;
  }

  static bool checkPhone(String phone) {
    final bool phoneValid = RegExp(r"^(?:[+0]9)?[0-9]{10,}$").hasMatch(phone);
    return phoneValid;
  }
}
