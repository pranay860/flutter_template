import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:network_retrofit/util/safe_api_call.dart';

import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;

  NetworkAdapter(this.apiService);

  @override
  void fetchPosts() {
    // To do
  }

  @override
  Future<Either<NetworkError, List<MyPosts>>> fetchMyPosts() async {
    final response = await safeApiCall(apiService.getMyPosts());
    return response.fold((l) => Left(l),
        (r) => Right(r.data.map((e) => e.transform()).toList()));
  }
}
