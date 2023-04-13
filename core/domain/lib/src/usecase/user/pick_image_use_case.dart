import 'package:domain/domain.dart';
import 'package:domain/src/repository/image_picker_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class ImageUseCase extends BaseUseCase<BaseError, ImageParams, ImageParams> {
  final ImageRepository _imageRepository;
  ImageUseCase(this._imageRepository);
  @override
  Future<Either<BaseError, ImageParams>> execute(
      {required ImageParams params}) async {
    return (await _imageRepository.pickImage(imagePath: params.imagePath));
  }
}

class ImageParams extends Params {
  String? imagePath;
  ImageParams({required this.imagePath});
  @override
  Either<AppError, bool> verify() {
    if (!Validator.isImagePathExists(imagePath)) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: "The image path does not exists"),
          type: ErrorType.uiImagePath));
    }
    return Right(true);
  }
}
