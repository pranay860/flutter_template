class Validator {
  static bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(email)) ? false : true;
  }

  static bool isEmpty(String data) {
    return data.isEmpty;
  }

  /// To validate first and last name
  static bool validateBasicFields(String? value) {
    if (value == null) return true;
    if (value.isEmpty || value.length < 3) {
      return false;
    }
    return true;
  }
  // "The address must contains more than 3 characters";

  /// To validate mobile number
  static bool validatePhoneNumber(String? value) {
    if (value == null) return true;
    if (value.length < 10 || value.length > 10) {
      return false;
    }
    return false;
  }
// "Invalid mobile number"
  /// To validate email
  // static String? validateFormEmail(String? value) {
  //   if (value == null) return null;
  //   if (RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
  //     return null;
  //   } else {
  //     return "Invalid email";
  //   }
  // }

  /// To validate user password
  static bool validatePassword(String? value) {
    if (value == null) return false;
    if (RegExp(
            r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d][A-Za-z\d!@#$%^&*()_+]{7,19}$")
        .hasMatch(value)) {
      return true;
    } else {
      return false;
      //  """Password must contains characters, numbers and one special character""";
    }
  }
}
