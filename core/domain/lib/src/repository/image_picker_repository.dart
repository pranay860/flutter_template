import 'package:domain/domain.dart';

abstract class ImageRepository {
  Future<Either<BaseError, ImageParams>> pickImage(
      {required String? imagePath});
}
