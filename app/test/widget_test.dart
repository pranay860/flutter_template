// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/dependencies.dart';
import 'package:app/feature/user_form/user/user_page.dart';
import 'package:app/feature/user_page_view_model.dart';
import 'package:app/myapp.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Form Widget", (widgetTester) async {
    final firstNameKey = find.byKey(const ValueKey("firstname"));
    widgetTester.pumpWidget(const MaterialApp(home: UserPage()));
    await widgetTester.enterText(firstNameKey, "pranay");
    // await widgetTester.tap(finder)
    expect(find.text("pranay"), findsOneWidget);
  });
}
