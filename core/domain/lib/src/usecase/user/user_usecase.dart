import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:localisation/strings.dart';

class UserUseCase
    extends BaseUseCase<BaseError, UserUseCaseParams, UserDetailsModel> {
  final UserRepository _userRepository;

  ///
  UserUseCase(this._userRepository);

  /// To verify if the user form fields validated
  /// or not
  @override
  Future<Either<BaseError, UserDetailsModel>> execute(
      {required UserUseCaseParams params}) async {
    return (await _userRepository.registerUserDetails(
            email: params.email,
            firstName: params.firstName,
            lastName: params.lastName,
            password: params.password,
            phoneNumber: params.phoneNumber))
        .fold((l) => Left(l), (r) {
      // print(r);
      return Right(r);
    });
  }
}

/// This below class is use for the use
/// cases which are use to validate form data
class UserUseCaseParams extends Params {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? confirmPassword;

  UserUseCaseParams(
      {this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.phoneNumber,
      this.confirmPassword});

  @override
  Either<AppError, bool> verify() {
    if (!Validator.validateFirstName(firstName)) {
      // if (firstName!.isEmpty) {
      //   return Left(AppError(
      //       throwable: Exception(),
      //       error: ErrorInfo(message: "First name should not be empty"),
      //       type: ErrorType.uiFirstName));
      // }
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: Strings.current.firstMessage),
          type: ErrorType.uiFirstName));
    }
    if (!Validator.validateLastName(lastName)) {
      // if (lastName!.isEmpty) {
      //   return Left(AppError(
      //       throwable: Exception(),
      //       error: ErrorInfo(message: "Last name should not be empty"),
      //       type: ErrorType.uiLastName));
      // }
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: Strings.current.firstMessage),
          type: ErrorType.uiLastName));
    }

    if (!Validator.validatePhoneNumber(phoneNumber)) {
      // if (phoneNumber!.isEmpty) {
      //   return Left(AppError(
      //       throwable: Exception(),
      //       error: ErrorInfo(message: "Phone number should not be empty"),
      //       type: ErrorType.uiFirstName));
      // }
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: Strings.current.phoneMessage),
          type: ErrorType.uiInvalidMobileNumber));
    }
    if (!Validator.validateEmail(email)) {
      // if (email!.isEmpty) {
      //   return Left(AppError(
      //       throwable: Exception(),
      //       error: ErrorInfo(message: "Email should not be empty"),
      //       type: ErrorType.uiFirstName));
      // }
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: Strings.current.emailMessage),
          type: ErrorType.uiInvalidEmail));
    }

    if (!Validator.validatePassword(password)) {
      // if (password!.isEmpty) {
      //   return Left(AppError(
      //       throwable: Exception(),
      //       error: ErrorInfo(message: "Password should not be empty"),
      //       type: ErrorType.uiFirstName));
      // }
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: Strings.current.passwordMessage),
          type: ErrorType.uiEmptyPassword));
    }
    if (!Validator.validateConfirmPassword(confirmPassword, password)) {
      // if (password!.isEmpty || confirmPassword!.isEmpty) {
      //   return Left(AppError(
      //       throwable: Exception(),
      //       error: ErrorInfo(message: "Password should not be empty"),
      //       type: ErrorType.uiFirstName));
      // }
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: Strings.current.confirmpasswordMessage),
          type: ErrorType.uiWrongPassword));
    }

    return Right(true);
  }
}
