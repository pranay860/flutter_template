import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class UserPageViewModel extends BasePageViewModel {
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailNameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmpasswordController =
      TextEditingController();
  int _counter = 0;
  int get counter => _counter;

  void increament() {
    _counter++;
    notifyListeners();
  }
}
