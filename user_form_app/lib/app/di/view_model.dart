import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/app/feature/user_form/user_page_view_model.dart';

/// Injecting dependency
/// to access the object of usermodel class
final userModelRef = ChangeNotifierProvider.autoDispose<UserPageViewModel>(
    (ref) => UserPageViewModel());
