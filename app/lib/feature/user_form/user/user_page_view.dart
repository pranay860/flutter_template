import 'dart:io';

import 'package:app/feature/user_form/widgets/widget_exports.dart';
import 'package:app/feature/user_page_view_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/menu_items.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localisation/strings.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class UserPageView extends BasePageViewWidget<UserPageViewModel> {
  UserPageView(ProviderBase<UserPageViewModel> model) : super(model);

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // AppStreamBuilder<Resource<LanguageCaseParmas>>(
          //     stream: model.getLanguageCode,
          //     initialData: Resource.success<LanguageCaseParmas>(
          //         data: LanguageCaseParmas(languageCode: "en")),
          //     dataBuilder: (context, ref) {
          DropdownButton<String>(
            value: model.locle.languageCode,
            items: languageCode
                .map((e) => DropdownMenuItem(
                      value: e.languageCode,
                      child: Text(e.languageCode),
                    ))
                .toList(),
            onChanged: (value) => model.changeLaunage(languageCode: value!),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePaths.myPosts);
              },
              child: const Text("Api sample"))
          // })
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: AppStreamBuilder<Resource<UserDetailsModel>>(
              stream: model.userUseCaseRequest,
              initialData: Resource.none(),
              dataBuilder: (context, userRef) {
                return Column(children: [
                  Text(
                    Strings.of(context).Register,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  AppStreamBuilder<Resource<ImageParams>>(
                      stream: model.getImageResourseRequest,
                      initialData: Resource.none(),
                      dataBuilder: (context, imageRef) {
                        final userImageRef = imageRef!.data;
                        return GestureDetector(
                          onTap: () {
                            // To pick image
                            model.pickImage();
                          },
                          child: imageRef.status == Status.success
                              ? SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(80),
                                      child: Image.file(
                                        File(userImageRef!.imagePath!),
                                        fit: BoxFit.cover,
                                      )))
                              : const CircleAvatar(
                                  maxRadius: 40,
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 60,
                                  ),
                                ),
                        );
                      },
                      onData: (data) {
                        // print(data.data?.verify());
                      }),
                  const SizedBox(height: 30),
                  //
                  CustomField(
                    labelText: Strings.of(context).firstname,
                    type: ErrorType.uiFirstName,
                    obscureText: false,
                    textEditingController: model.firstNameController,
                    error: userRef?.dealSafeAppError?.error.message,
                    onChanged: (value) =>
                        model.onValidate(ErrorType.uiFirstName),
                    errorType: userRef?.dealSafeAppError?.type,
                  ),

                  const SizedBox(height: 15),
                  CustomField(
                    labelText: Strings.of(context).lastname,
                    type: ErrorType.uiLastName,
                    obscureText: false,
                    textEditingController: model.lastNameController,
                    error: userRef?.dealSafeAppError?.error.message,
                    onChanged: (value) =>
                        model.onValidate(ErrorType.uiLastName),
                    widget: null,
                    errorType: userRef?.dealSafeAppError?.type,
                  ),

                  const SizedBox(height: 15),
                  CustomField(
                    labelText: Strings.of(context).phonenumber,
                    type: ErrorType.uiInvalidMobileNumber,
                    obscureText: false,
                    textEditingController: model.phoneController,
                    error: userRef?.dealSafeAppError?.error.message,
                    onChanged: (value) =>
                        model.onValidate(ErrorType.uiInvalidMobileNumber),
                    widget: null,
                    errorType: userRef?.dealSafeAppError?.type,
                  ),

                  const SizedBox(height: 15),
                  CustomField(
                    labelText: Strings.of(context).email,
                    type: ErrorType.uiInvalidEmail,
                    obscureText: false,
                    textEditingController: model.emailController,
                    error: userRef?.dealSafeAppError?.error.message,
                    onChanged: (value) =>
                        model.onValidate(ErrorType.uiInvalidEmail),
                    widget: null,
                    errorType: userRef?.dealSafeAppError?.type,
                  ),

                  const SizedBox(height: 15),
                  // gender widget
                  GenderWidget(model: model),

                  //
                  CustomField(
                    labelText: Strings.of(context).password,
                    type: ErrorType.uiEmptyPassword,
                    obscureText: model.isVisible,
                    textEditingController: model.passwordController,
                    error: userRef?.dealSafeAppError?.error.message,
                    onChanged: (value) =>
                        model.onValidate(ErrorType.uiEmptyPassword),
                    widget: IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        model.changeVisibility();
                      },
                      icon: model.isVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons
                              .visibility), // change visbilty according to icons
                    ),
                    errorType: userRef?.dealSafeAppError?.type,
                  ),

                  const SizedBox(height: 15),
                  CustomField(
                    labelText: Strings.of(context).confirmpassword,
                    type: ErrorType.uiWrongPassword,
                    obscureText: true,
                    textEditingController: model.confirmpasswordController,
                    error: userRef?.dealSafeAppError?.error.message,
                    onChanged: (value) =>
                        model.onValidate(ErrorType.uiWrongPassword),
                    widget: null,
                    errorType: userRef?.dealSafeAppError?.type,
                  ),

                  const SizedBox(height: 15),
                  AppStreamBuilder<Resource<bool>>(
                    initialData: Resource.none(),
                    stream: model.getUserDataStatus,
                    dataBuilder: (context, ref) {
                      if (ref?.status == Status.loading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ButtonWidget(
                          showButton: false,
                          onNext: () {
                            if (kDebugMode) {
                              print("Status ${userRef?.dealSafeAppError}");
                            }
                            if (userRef?.status == Status.success) {
                              model.registerUserData(UserDetailsModel(
                                  firstName: model.firstNameController.text,
                                  lastName: model.lastNameController.text,
                                  email: model.emailController.text,
                                  phoneNumber: model.phoneController.text,
                                  gender: model.genderValue.name,
                                  password: null));
                            }
                          },
                        );
                      }
                    },
                    onData: (value) {
                      model.resetControllers();
                    },
                  ),
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
