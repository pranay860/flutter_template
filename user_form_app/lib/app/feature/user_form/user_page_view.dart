import 'package:flutter/material.dart';
import 'package:my_app/app/feature/user_form/user_page_view_model.dart';
import 'package:my_app/app/feature/user_form/widgets/widget_exports.dart';
import 'package:my_app/app/routes/route_paths.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class UserPageView extends BasePageViewWidget<UserPageViewModel> {
  UserPageView(super.providerBase, {super.key});

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              child: Column(children: [
                Text(
                  "Register",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(model.counter.toString()),
                GestureDetector(
                  onTap: () {
                    print("object");
                    model.increament();
                  },
                  child: const CircleAvatar(
                    maxRadius: 40,
                    child: Icon(
                      Icons.account_circle,
                      size: 60,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("First Name*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Last Name*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Phone Number*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Email*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                // gender widget
                GenderWidget(),
                //
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: const Icon(Icons
                            .visibility), // change visbilty according to icons
                      ),
                      label: const Text("Password*"),
                      focusedBorder: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      label: Text("Confirm Password*"),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                ButtonWidget(
                  showButton: false,
                  onNext: () {
                    Navigator.pushNamed(context, RoutePaths.eduction);
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
