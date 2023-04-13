import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:shared/shared.dart';

class SampleBaseUseCase extends BaseUseCase<BaseError, SampleParams, bool> {
  @override
  Future<Either<BaseError, bool>> execute(
      {required SampleParams params}) async {
    return Future.value();
  }
}

class SampleParams extends Params {
  @override
  Either<AppError, bool> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }
}
