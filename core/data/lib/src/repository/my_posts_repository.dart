import 'package:data/src/out/network_port.dart';
import 'package:domain/domain.dart';

class MyPostsRepositoryImpl extends MyPostRepository {
  final NetworkPort _networkPort;
  MyPostsRepositoryImpl(this._networkPort);
  @override
  Future<Either<NetworkError, List<MyPosts>>> getMyPosts() async {
    final result = await _networkPort.fetchMyPosts();
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
