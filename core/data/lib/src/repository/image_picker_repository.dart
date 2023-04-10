import 'package:domain/domain.dart';

class ImagePickerRepositoryImpl extends ImageRepository {
  @override
  Future<Either<BaseError, ImageParams>> pickImage(
      {required String? imagePath}) async {
    return Right(ImageParams(imagePath: imagePath));
  }
}
