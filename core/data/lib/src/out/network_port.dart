import 'package:domain/domain.dart';

abstract class NetworkPort {
  void fetchPosts();

  Future<Either<NetworkError, List<MyPosts>>> fetchMyPosts();
}
