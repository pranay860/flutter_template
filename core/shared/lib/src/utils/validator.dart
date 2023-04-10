class Validator {
  static bool validateEmail(String? email) {
    if (email == null) return true;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(email)) ? false : true;
  }

  static bool validateMyEmail(String email, Enum type) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(email)) ? false : true;
  }

  static bool isEmpty(String data) {
    return data.isEmpty;
  }

  /// To validate first name
  static bool validateFirstName(String? value) {
    if (value == null) return true;
    if (value.isEmpty || value.length < 3) {
      return false;
    }
    return true;
  }

  /// To validate first name
  static bool validateLastName(String? value) {
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
    return true;
  }

  /// To validate user password
  static bool validatePassword(String? value) {
    if (value == null) return true;
    if (RegExp(
            r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d][A-Za-z\d!@#$%^&*()_+]{7,19}$")
        .hasMatch(value)) {
      return true;
    } else {
      return false;
      //  """Password must contains characters, numbers and one special character""";
    }
  }

  /// To check if the confirmpassword is matches with
  /// priviously added password
  static bool validateConfirmPassword(String? value, String? password) {
    if (value == null && password == null) return true;
    if (value == password) {
      return true;
    }
    return false;
  }

  /// To check if the image path is exists or not
  static bool isImagePathExists(String? imagePath) {
    if (imagePath == null) return false;
    return true;
  }
}
