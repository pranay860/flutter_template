import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/user_form/user/user_page_view.dart';
import 'package:app/feature/user_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class UserPage extends BasePage<UserPageViewModel> {
  // final UserDetailParams userDetailParams;
  const UserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserPageState();
}

class UserPageState extends BaseStatefulPage<UserPageViewModel, UserPage> {
  @override
  Widget buildView(BuildContext context, UserPageViewModel model) {
    return UserPageView(provideBase());
  }

  @override
  ProviderBase<UserPageViewModel> provideBase() {
    return userPageViewModelProvider;
  }
}
