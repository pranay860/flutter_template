import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/app/di/view_model.dart';
import 'package:my_app/app/feature/user_form/eduction/education_page_view.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class EducationPage extends BasePage<UserPageViewModel> {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EducationPageState();
}

class EducationPageState
    extends BaseStatefulPage<UserPageViewModel, EducationPage> {
  @override
  Widget buildView(BuildContext context, UserPageViewModel model) {
    return EducationPageView(provideBase());
  }

  @override
  ProviderBase<UserPageViewModel> provideBase() {
    return userModelRef;
  }
}
