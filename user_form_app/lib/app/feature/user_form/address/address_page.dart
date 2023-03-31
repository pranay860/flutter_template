import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/app/di/view_model.dart';
import 'package:my_app/app/feature/user_form/address/address_page_view.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AddressPage extends BasePage<UserPageViewModel> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddressPageState();
}

class AddressPageState
    extends BaseStatefulPage<UserPageViewModel, AddressPage> {
  @override
  Widget buildView(BuildContext context, UserPageViewModel model) {
    return AddressPageView(provideBase());
  }

  @override
  ProviderBase<UserPageViewModel> provideBase() {
    return userModelRef;
  }
}
