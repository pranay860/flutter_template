import 'package:domain/domain.dart';

abstract class MyPostRepository {
  /// To get myposts
  Future<Either<NetworkError, List<MyPosts>>> getMyPosts();
}
