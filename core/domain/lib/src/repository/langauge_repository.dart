import 'package:domain/domain.dart';

abstract class LanguageRespository {
  Future<Either<BaseError, LanguageCaseParmas>> changeLanguage(
      {required String languageCode});
}
