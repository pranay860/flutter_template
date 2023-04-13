import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/posts/my_post_page_model.dart';
import 'package:app/feature/posts/my_posts_page_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:riverpod/src/framework.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class MyPostsPage extends BasePage<MyPostsViewModel> {
  const MyPostsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyPostsPageState();
}

class MyPostsPageState extends BaseStatefulPage<MyPostsViewModel, MyPostsPage> {
  @override
  void onModelReady(MyPostsViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    super.onModelReady(model);
  }

  @override
  Widget buildView(BuildContext context, MyPostsViewModel model) =>
      MyPostPageView(provideBase());

  @override
  ProviderBase<MyPostsViewModel> provideBase() => myPostsViewModel;
}
