import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/response/my_posts_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  /// To get posts
  @GET("products")
  Future<HttpResponse<List<MyPostsResponseEntity>>> getMyPosts();

  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }
}
