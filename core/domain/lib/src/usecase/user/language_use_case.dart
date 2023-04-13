import 'package:domain/domain.dart';
import 'package:domain/src/repository/langauge_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class LanguageUseCase
    extends BaseUseCase<BaseError, LanguageCaseParmas, LanguageCaseParmas> {
  //
  final LanguageRespository _languageRespository;
  LanguageUseCase(this._languageRespository);

  /// To execute usecase for language
  @override
  Future<Either<BaseError, LanguageCaseParmas>> execute(
      {required LanguageCaseParmas params}) async {
    return (await _languageRespository.changeLanguage(
            languageCode: params.languageCode))
        .fold((l) => Left(l), (r) => Right(r));
  }
}

class LanguageCaseParmas extends Params {
  String languageCode;
  LanguageCaseParmas({required this.languageCode});
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
