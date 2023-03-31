import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:my_app/app/utils/menu_items.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../widgets/widget_exports.dart';

class AddressPageView extends BasePageViewWidget<UserPageViewModel> {
  AddressPageView(ProviderBase<UserPageViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Your Address",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black))),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: model.addressFormKey,
              child: Column(children: [
                TextFormField(
                  validator: (value) {
                    if (value == null) return null;
                    if (value.isEmpty || value.length < 3) {
                      return "The address must contains more than 3 characters";
                    }
                    return null;
                  },
                  controller: model.addressController,
                  decoration: const InputDecoration(
                      label: Text("Address*"), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value == null) return null;
                    if (value.isEmpty || value.length < 3) {
                      return "The landmark must contains more than 3 characters";
                    }
                    return null;
                  },
                  controller: model.landMarkController,
                  decoration: const InputDecoration(
                      label: Text("LandMark*"), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]*$'))
                  ],
                  controller: model.cityController,
                  decoration: const InputDecoration(
                      label: Text("City"), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  items: stateList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) => model.changeState(value!),
                  validator: (value) =>
                      value == null ? "State is required" : null,
                  decoration: const InputDecoration(
                      label: Text("Select your state*"),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: model.pinCodeController,
                  decoration: const InputDecoration(
                    label: Text("Pincode"),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ButtonWidget(
                  showButton: false,
                  buttonName: "Submit",
                  onNext: () {
                    if (model.addressFormKey.currentState!.validate()) {
                      //
                    }
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
