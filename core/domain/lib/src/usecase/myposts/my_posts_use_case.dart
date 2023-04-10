import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';

class MyPostsUseCase
    extends BaseUseCase<BaseError, MyPostsUseCaseParams, List<MyPosts>> {
  final MyPostRepository _myPostRepository;
  MyPostsUseCase(this._myPostRepository);

  ///
  @override
  Future<Either<BaseError, List<MyPosts>>> execute(
      {required MyPostsUseCaseParams params}) async {
    return (await _myPostRepository.getMyPosts())
        .fold((l) => Left(l), (r) => Right(r));
  }
}

class MyPostsUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
