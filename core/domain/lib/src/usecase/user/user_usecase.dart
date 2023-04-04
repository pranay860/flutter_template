import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class MyuserUseCase
    extends BaseUseCase<BaseError, UserUseCaseParams, UserDetailsModel> {
  final UserRepository _userRepository;

  ///
  MyuserUseCase(this._userRepository);

  /// To verify if the user form fields validated
  /// or not
  @override
  Future<Either<BaseError, UserDetailsModel>> execute(
      {required UserUseCaseParams params}) async {
    return Future.value((await _userRepository.registerUserDetails(
            email: params.email,
            firstName: params.firstName,
            lastName: params.lastName,
            password: params.password,
            phoneNumber: params.phoneNumber))
        .fold((l) => Left(l), (r) => Right(r)));
  }
}

/// This below class is use for the use
/// cases which are use to validate form data
class UserUseCaseParams extends Params {
  String email;
  String password;
  String firstName;
  String lastName;
  String phoneNumber;
  UserUseCaseParams(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.phoneNumber});

  @override
  Either<AppError, bool> verify() {
    if (!Validator.validateEmail(email)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: "Invalid email"),
          type: ErrorType.uiInvalidEmail));
    } else if (!Validator.validateBasicFields(firstName)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(
              message: "The address must contains more than 3 characters"),
          type: ErrorType.uiAddressError));
    } else if (!Validator.validatePhoneNumber(phoneNumber)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: "Invalid mobile number"),
          type: ErrorType.uiInvalidMobileNumber));
    } else if (!Validator.validatePassword(password)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(
              message:
                  """Password must contains characters, numbers and one special character"""),
          type: ErrorType.uiEmptyPassword));
    }

    return Right(true);
  }
}
