import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class MyPostsViewModel extends BasePageViewModel {
  final MyPostsUseCase _myPostsUseCase;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  MyPostsViewModel(this._myPostsUseCase, this.exceptionHandlerBinder) {
    getMyPosts();
    if (kDebugMode) {
      print("Constructor called");
    }
  }

  /// To add posts to the resourse posts request
  final PublishSubject<Resource<List<MyPosts>>> _addMyPostsRequestsResourse =
      PublishSubject();

  /// To get myposts stream
  Stream<Resource<List<MyPosts>>> get getMyPostsListStream =>
      _addMyPostsRequestsResourse.stream;

  /// To get mypost
  void getMyPosts() {
    exceptionHandlerBinder.handle(block: () {
      MyPostsUseCaseParams myPostsUseCaseParams = MyPostsUseCaseParams();
      RequestManager<List<MyPosts>>(
        myPostsUseCaseParams,
        createCall: () => _myPostsUseCase.execute(params: myPostsUseCaseParams),
      ).asFlow().listen((event) {
        _addMyPostsRequestsResourse.add(event);
      });
    }).execute();
  }
}
