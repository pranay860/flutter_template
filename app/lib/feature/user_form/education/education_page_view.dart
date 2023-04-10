import 'package:app/feature/user_page_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import '../widgets/widget_exports.dart';

class EducationPageView extends BasePageViewWidget<UserPageViewModel> {
  EducationPageView(ProviderBase<UserPageViewModel> model) : super(model);

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Your Info",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Form(
            // key: model.educationFormKey,
            child: Column(children: [
              const SizedBox(height: 20),
              // Education information
              EducationWdiget(model: model),
              const SizedBox(height: 15),
              const Divider(thickness: 1.5),
              const SizedBox(height: 15),
              // Work experience details
              ProfessionalInfoWidget(model: model),
              //
              const SizedBox(height: 15),
              ButtonWidget(
                showButton: true,
                onNext: () {
                  // if (model.educationFormKey.currentState!.validate()) {
                  //   Navigator.pushNamed(context, RoutePaths.address);
                  // }
                },
                onPrev: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15)
            ]),
          ),
        ),
      ),
    );
  }
}
