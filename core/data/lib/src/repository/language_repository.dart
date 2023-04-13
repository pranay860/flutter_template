import 'package:domain/domain.dart';

class LanguageRepositoryImpl extends LanguageRespository {
  @override
  Future<Either<BaseError, LanguageCaseParmas>> changeLanguage(
      {required String languageCode}) async {
    return Right(LanguageCaseParmas(languageCode: languageCode));
  }
}
