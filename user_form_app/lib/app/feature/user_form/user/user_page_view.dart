import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:my_app/app/feature/user_form/widgets/widget_exports.dart';
import 'package:my_app/app/routes/route_paths.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class UserPageView extends BasePageViewWidget<UserPageViewModel> {
  UserPageView(ProviderBase<UserPageViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: model.basicInfoFormKey,
              child: Column(children: [
                Text(
                  "Register",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // To pick image
                    model.pickImage();
                  },
                  child: model.userImage != null
                      ? SizedBox(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.file(
                                File(model.userImage!.path),
                                fit: BoxFit.cover,
                              )))
                      : const CircleAvatar(
                          maxRadius: 40,
                          child: Icon(
                            Icons.account_circle,
                            size: 60,
                          ),
                        ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: model.firstNameController,
                  decoration: const InputDecoration(
                    label: Text("First Name*"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) return null;
                    if (value.length < 3) {
                      return "First name must contians more than 3 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
                TextFormField(
                  controller: model.lastNameController,
                  decoration: const InputDecoration(
                    label: Text("Last Name*"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) return null;
                    if (value.length < 3) {
                      return "Last name must contians more than 3 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: model.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      label: Text("Phone Number*"),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null) return null;
                    if (value.length < 10 || value.length > 10) {
                      return "Invalid mobile number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: model.emailNameController,
                  validator: (value) {
                    // Email validation
                    if (value == null) return null;
                    if (RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                        .hasMatch(value)) {
                      return null;
                    } else {
                      return "Invalid email";
                    }
                  },
                  decoration: const InputDecoration(
                      label: Text("Email*"), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                // gender widget
                GenderWidget(model: model),
                //
                TextFormField(
                  obscureText: model.isVisible,
                  controller: model.passwordController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          model.changeVisibility();
                        },
                        icon: model.isVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons
                                .visibility), // change visbilty according to icons
                      ),
                      label: const Text("Password*"),
                      border: const OutlineInputBorder()),
                  validator: (value) {
                    // Email validation
                    if (value == null) return null;
                    if (RegExp(
                            r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d][A-Za-z\d!@#$%^&*()_+]{7,19}$")
                        .hasMatch(value)) {
                      return null;
                    } else {
                      return """Password must contains characters, numbers and one special character""";
                    }
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: model.confirmpasswordController,
                  obscureText: true,
                  validator: (value) {
                    // Email validation
                    if (value == null) return null;
                    if (value.isEmpty) {
                      return "Confirm password is required";
                    } else if (value != model.passwordController.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      label: Text("Confirm Password*"),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                ButtonWidget(
                  showButton: false,
                  onNext: () {
                    if (model.basicInfoFormKey.currentState!.validate()) {
                      Navigator.pushNamed(context, RoutePaths.eduction);
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
