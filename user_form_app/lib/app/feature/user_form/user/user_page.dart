import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/app/di/view_model.dart';
import 'package:my_app/app/feature/user_form/user/user_page_view.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:riverpod/src/framework.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class UserPage extends BasePage<UserPageViewModel> {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserPageState();
}

class UserPageState extends BaseStatefulPage<UserPageViewModel, UserPage> {
  @override
  Widget buildView(BuildContext context, UserPageViewModel model) {
    return UserPageView(provideBase());
  }
  // @override
  // void onModelReady(UserPageViewModel model) {
  
  //   super.onModelReady(model);
  // }
  @override
  ProviderBase<UserPageViewModel> provideBase() {
    return userModelRef;
  }
}
