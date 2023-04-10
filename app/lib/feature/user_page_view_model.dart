import 'package:app/model/resource.dart';
import 'package:app/utils/enums.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:rxdart/subjects.dart';

@injectable
class UserPageViewModel extends BasePageViewModel {
  final UserUseCase _userUseCase;
  final LanguageUseCase _languageUseCase;
  final ImageUseCase _imageUseCase;
  final GetUserDataUseCase _getuserDataUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  //
  UserPageViewModel(this._userUseCase, this._languageUseCase,
      this._imageUseCase, this._getuserDataUseCase, this._saveUserDataUseCase) {
    //
    _addUserUseCaseRequest.listen((params) {
      RequestManager<UserDetailsModel>(
        params,
        createCall: () => _userUseCase.execute(params: params),
      ).asFlow().listen((event) {
        _addUserResponse.add(event);
      });
    });

    _addImageRequest.listen((params) {
      RequestManager<ImageParams>(
        params,
        createCall: () => _imageUseCase.execute(params: params),
      ).asFlow().listen((event) {
        _addResourseImageRequest.add(event);
      });
    });

    // _addLanguageRequest.listen((params) {
    //   RequestManager<LanguageCaseParmas>(
    //     params,
    //     createCall: () => _languageUseCase.execute(params: params),
    //   ).asFlow().listen((event) {
    //     // if (event.status == Status.success) {

    //     // }
    //     // _addResourseLanguageResp.add(event);
    //   });
    // });
    // To set by default value as en language code
    // changeLaunage(languageCode: "en");
  }
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

  /// To get language request
  final PublishSubject<LanguageCaseParmas> _addLanguageRequest =
      PublishSubject();

  final PublishSubject<Resource<bool>> _addUserSavedDataStatus =
      PublishSubject();

  /// To get saved user data status
  Stream<Resource<bool>> get getUserDataStatus =>
      _addUserSavedDataStatus.stream;

  /// To add image request
  final PublishSubject<ImageParams> _addImageRequest = PublishSubject();

  /// To add request resourse image request
  final PublishSubject<Resource<ImageParams>> _addResourseImageRequest =
      PublishSubject();

  /// To get image resourse image request
  Stream<Resource<ImageParams>> get getImageResourseRequest =>
      _addResourseImageRequest.stream;

  Stream<LanguageCaseParmas> get getLanguageRequest =>
      _addLanguageRequest.stream;

  /// To add user request of type [UserUseCaseParams]
  final PublishSubject<UserUseCaseParams> _addUserUseCaseRequest =
      PublishSubject();

  /// To add user response into [_addUserResponse]
  final PublishSubject<Resource<UserDetailsModel>> _addUserResponse =
      PublishSubject();

  // final PublishSubject<Resource<LanguageCaseParmas>> _addResourseLanguageResp =
  //     PublishSubject();

  ///
  // Stream<Resource<LanguageCaseParmas>> get getLanguageCode =>
  //     _addResourseLanguageResp.stream;

  /// This below getter will provide output of user parameters
  /// so that we can acess it int `AppStreamBuilder` widget
  Stream<Resource<UserDetailsModel>> get userUseCaseRequest =>
      _addUserResponse.stream;

  /// To get image file
  // XFile? userImage;

  /// To pick image from gallery
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    String? path = image?.path;
    ImageParams imageParams = ImageParams(imagePath: path);
    _addImageRequest.add(imageParams);
  }

  Locale _locale = const Locale("en");
  Locale get locle => _locale;

  /// To change current language
  /// of the app
  void changeLaunage({required String languageCode}) {
    _locale = Locale(languageCode);
    notifyListeners();
    // LanguageCaseParmas params = LanguageCaseParmas(languageCode: languageCode);
    // _addLanguageRequest.add(params);
  }

  /// To register
  /// the user response
  void onValidate(Enum? fieldtype) {
    UserUseCaseParams userCaseParams = UserUseCaseParams(
      email: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      password: passwordController.text,
      phoneNumber: phoneController.text,
      confirmPassword: confirmpasswordController.text,
    );
    _addUserUseCaseRequest.add(userCaseParams);

    // // print(value);

    // adding params to request
  }

  void resetControllers() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    confirmpasswordController.clear();
    
  }

  /// To save user data into firestore
  void registerUserData(UserDetailsModel userDetailsModel) {
    SaveUserDataUseCaseParams saveUserDataUseCaseParams =
        SaveUserDataUseCaseParams(
            userId: "YuxaAEadiaWEdapodeaA", userDetailsModel: userDetailsModel);
    RequestManager<bool>(
      saveUserDataUseCaseParams,
      createCall: () =>
          _saveUserDataUseCase.execute(params: saveUserDataUseCaseParams),
    ).asFlow().listen((event) {
      print(event.status);
      _addUserSavedDataStatus.add(event);
    });
  }
  // void registerUser() {
  //   UserUseCaseParams params = UserUseCaseParams(
  //       email: value,
  //       firstName: value,
  //       lastName: value,
  //       password: value,
  //       phoneNumber: value,
  //       confirmPassword: value);
  // }

  // Locale _locale = const Locale("en");
  // Locale get locale => _locale;

  // void changeLanguage() {
  //   _locale = locale;
  //   notifyListeners();
  // }

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
