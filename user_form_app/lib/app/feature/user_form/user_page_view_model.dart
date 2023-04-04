import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/app/data/model/resource.dart';
import 'package:my_app/app/utils/enums.dart';
import 'package:my_app/app/utils/request_manager.dart';
import 'package:rxdart/subjects.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class UserPageViewModel extends BasePageViewModel {
  MyuserUseCase _userUseCase;
  UserPageViewModel(this._userUseCase) {
    _userUseCaseRequest.listen((value) {
      RequestManager<UserDetailsModel>(value,
              createCall: () => _userUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        _userFormResponse.add(event);
        if (kDebugMode) {
          print(event);
        }
      }).onError((err) {
        if (kDebugMode) {
          print(err);
        }
      });
    });
  }
  //
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmpasswordController =
      TextEditingController();

  /// Educational Details controllers
  late TextEditingController gradeController = TextEditingController();
  late TextEditingController experienceController = TextEditingController();
  late TextEditingController designationController = TextEditingController();
  late TextEditingController domainController = TextEditingController();

  /// Address Details controllers

  late TextEditingController addressController = TextEditingController();
  late TextEditingController landMarkController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController pinCodeController = TextEditingController();

  /// Form keys to manage validation
  final basicInfoFormKey = GlobalKey<FormState>();
  final educationFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  final PublishSubject<UserUseCaseParams> _userUseCaseRequest =
      PublishSubject();

  final PublishSubject<Resource<UserDetailsModel>> _userFormResponse =
      PublishSubject();

  Stream<Resource<UserDetailsModel>> get userFormResponse =>
      _userFormResponse.stream;

  /// To get image file
  XFile? userImage;

  /// To pick image from gallery
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = image;
      notifyListeners();
    }
  }

  void registerUser() {
    UserUseCaseParams params = UserUseCaseParams(
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        password: passwordController.text,
        phoneNumber: phoneController.text);
    _userUseCaseRequest.add(params);
  }

  /// This will take enum of gender
  Enum genderValue = Gender.male;

  /// To change gender
  void changeGender(Enum value) {
    genderValue = value;
    notifyListeners();
  }

  bool isVisible = true;

  /// To manage visibility
  /// of password
  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  String _degree = "";

  /// To get degree
  String get degree => _degree;

  /// To change user degree
  void changeDegree(String value) => _degree = value;

  /// To set passing year empty by default
  String _passingYear = "";

  /// To get passing year
  String get passingYear => _passingYear;

  /// To change passing year
  void changePassingYear(String year) => _passingYear = year;

  /// To set state empty by default
  String _state = "";

  /// To get state
  String get state => _state;

  /// To change state
  void changeState(String value) => _state = value;
}
