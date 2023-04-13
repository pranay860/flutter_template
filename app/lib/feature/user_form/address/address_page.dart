import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/user_form/address/address_page_view.dart';
import 'package:app/feature/user_page_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class AddressPage extends BasePage<UserPageViewModel> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddressPageState();
}

class AddressPageState
    extends BaseStatefulPage<UserPageViewModel, AddressPage> {
  @override
  void initState() {
    if (kDebugMode) {
      print("InitState called");
    }
    super.initState();
  }

  @override
  Widget buildView(BuildContext context, UserPageViewModel model) {
    return AddressPageView(provideBase());
  }

  @override
  ProviderBase<UserPageViewModel> provideBase() {
    return userPageViewModelProvider;
  }
}
